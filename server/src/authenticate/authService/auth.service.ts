import { Injectable } from "@nestjs/common";
import { JwtService } from "@nestjs/jwt";
import { UserService } from "src/Users/services/users.services";
import { AuthenticationDto } from "../dto/AuthenticationDto";

@Injectable()
export class AuthService {
  constructor(
    private usersService: UserService,
    private jwtService: JwtService,
  ) {}

  async validateUser(useremail: string, pass: string): Promise<any> {
    const user = await this.usersService.findUsersByEmail(useremail);
    if (user && user.password === pass) {
      const { password, ...result } = user;
      return result;
    }
    return null;
  }

  async login(user: AuthenticationDto) {
    const payload = { username: user.email, sub: user.password };
    return {
      access_token: this.jwtService.sign(payload, {
        secret: "qwertyuiop",
      }),
    };
  }
}
