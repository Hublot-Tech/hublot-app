import {
  Injectable,
  Dependencies,
  UnauthorizedException,
} from "@nestjs/common";
import { UserService } from "../users/users.service";
import { JwtService } from "@nestjs/jwt";
import { jwtConstants } from "./const/constantes";

@Injectable()
@Dependencies(UserService, JwtService)
export class AuthService {
  constructor(
    private readonly usersService: UserService,
    private readonly jwtService: JwtService,
  ) {}

  async signIn(email: string, pass: string) {
    // const user = await this.usersService.findByEmail(email);
    // if (user?.password !== pass) {
    //   throw new UnauthorizedException();
    // }
    // const payload = { username: user.email, sub: user.password };
    // return {
    //   access_token: await this.jwtService.signAsync(payload),
    // };

    const payload = { username: email, sub: pass };
    
    return {
      access_token: await this.jwtService.signAsync(payload,{
        secret: jwtConstants.secret,
      }),
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
