import { OAuth2Client } from "google-auth-library";
import { AuthGoogleLoginDto } from "../dto/auth.dto";
import { HttpException, Injectable } from "@nestjs/common";
import { CreateUserDto, UserDto } from "src/modules/users/dto/users.dto";

import { AuthService } from "../auth.service";
import { UserService } from "src/modules/users/users.service";

@Injectable()
export class SocialAuthService {
  private google: OAuth2Client;

  constructor(
    private userService: UserService,
    private authService: AuthService,
  ) {
    this.google = new OAuth2Client(
      process.env.AUTH_GOOGLE_CLIENT_ID,
      process.env.AUTH_GOOGLE_CLIENT_SECRET,
    );
  }

  async getProfileByToken(loginDto: AuthGoogleLoginDto): Promise<any> {
    const ticket = await this.google.verifyIdToken({
      idToken: loginDto.idToken,
      audience: [process.env.AUTH_GOOGLE_CLIENT_ID],
    });

    const data = ticket.getPayload();

    if (!data) {
      return {
        message: "Invalid token",
        success: false,
      };
    }

    return this.registerAndLogin(data);
  }

  async registerAndLogin(data: any) {
    let payload: CreateUserDto = {
        fullname: data?.name,
        email: data?.email,
        phoneNumber: data?.phoneNumber ?? "",
        locale: data?.locale,
        address: "fr",
        isOnline: true,
        isVerified: false,
        password: this.generatedpassword(6),
      },
      user = await this.userService.register(payload);
    const auth = await this.authService.signIn(user?.email, user?.password);
    return auth;
  }

  generatedpassword(length: number) {
    const chars = "HUBLOT0123456789";
    let result = "";
    for (let i = 0; i < length; i++) {
      result += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return result;
  }
}
