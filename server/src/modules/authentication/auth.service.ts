import { Injectable, Dependencies } from "@nestjs/common";
import { UserService } from "../users/users.service";
import { JwtService } from "@nestjs/jwt";
import { jwtConstants } from "./const/constantes";
import * as bcrypt from "bcrypt";

@Injectable()
@Dependencies(UserService, JwtService)
export class AuthService {
  constructor(
    private readonly usersService: UserService,
    private readonly jwtService: JwtService,
  ) {}

  async signIn(email: string, pass: string) {
    const user = await this.usersService.findByEmail(email);
    const isMatch = await bcrypt.compare(pass, user.password);
    if (!isMatch) {
      return {
        message:
          "Incorrect email or password, please check your connection settings",
        success: false,
      };
    }
    const payload = { username: user.email, sub: user.password };

    return {
      accessToken: await this.jwtService.signAsync(payload, {
        secret: process.env.JWT_KEY,
      }),
      success: true,
    };
  }

  async validateUser(useremail: string, pass: string): Promise<any> {
    const user = await this.usersService.findByEmail(useremail);
    if (user && user.password === pass) {
      const { password, ...result } = user;
      return result;
    }
    return null;
  }
}
