import { Injectable } from "@nestjs/common";
import { JwtService } from "@nestjs/jwt";
import { UserService } from "../modules/users/users.service";
import { AuthenticationDto } from "./dto/AuthenticationDto";
import { constants } from "src/constant";

@Injectable()
export class AuthService {
  constructor(
    private usersService: UserService,
    private jwtService: JwtService,
  ) {}

  async validateUser(useremail: string, pass: string): Promise<any> {
    const user = await this.usersService.findByEmail(useremail);
    if (user && user.password === pass) {
      // eslint-disable-next-line @typescript-eslint/no-unused-vars
      const { password, ...result } = user;
      return result;
    }
    return null;
  }

  async login(user: AuthenticationDto) {
    const payload = { username: user.email, sub: user.password };
    return {
      access_token: this.jwtService.sign(payload, {
        secret: constants.JWT_SECRET,
      }),
    };
  }
}
