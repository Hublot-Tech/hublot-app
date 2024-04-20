import { Injectable, UnauthorizedException } from "@nestjs/common";
import { JwtService } from "@nestjs/jwt";
import * as bcrypt from "bcrypt";
import { jwtConstants } from "../../constants/constants";
import { UserDto } from "../users/dto";
import { UserService } from "../users/users.service";

@Injectable()
export class AuthService {
  constructor(
    private readonly usersService: UserService,
    private readonly jwtService: JwtService,
  ) {}

  async signIn(email: string, pass: string): Promise<string> {
    const user = await this.usersService.findByEmail(email);
    if (!bcrypt.compareSync(pass, user.password)) {
      throw new UnauthorizedException(
        "Incorrect email or password, please check your connection settings",
      );
    }
    const payload = { username: user.email };
    return this.jwtService.sign(payload, {
      secret: jwtConstants.secret,
    });
  }

  async validateUser(
    username: string,
    password: string,
  ): Promise<Omit<UserDto, "password">> {
    const user = await this.usersService.findByEmail(username);
    if (user && user.password === password) {
      // eslint-disable-next-line @typescript-eslint/no-unused-vars
      const { password, ...result } = user;
      return result;
    }
    return null;
  }
}
