import { Injectable, UnprocessableEntityException } from "@nestjs/common";
import { OAuth2Client, TokenPayload } from "google-auth-library";
import { CreateUserDto, Locale } from "src/modules/users/dto/users.dto";
import { AuthGoogleLoginDto } from "../dto/auth.dto";

import { JwtService } from "@nestjs/jwt";
import { UserService } from "src/modules/users/users.service";
import { jwtConstants } from "src/constants/constants";

@Injectable()
export class SocialAuthService {
  private google: OAuth2Client;

  constructor(
    private userService: UserService,
    private readonly jwtService: JwtService,
  ) {
    this.google = new OAuth2Client(
      process.env.AUTH_GOOGLE_CLIENT_ID,
      process.env.AUTH_GOOGLE_CLIENT_SECRET,
    );
  }

  async getProfileByToken(loginDto: AuthGoogleLoginDto): Promise<string> {
    const ticket = await this.google.verifyIdToken({
      idToken: loginDto.idToken,
      audience: [process.env.AUTH_GOOGLE_CLIENT_ID],
    });

    const data = ticket.getPayload();

    if (!data) {
      throw new UnprocessableEntityException(
        "Could not process id token payload",
      );
    }

    return this.authenticateUser(data);
  }

  async authenticateUser(data: TokenPayload) {
    const payload: CreateUserDto = {
      fullname: data.name,
      email: data.email,
      phoneNumber: null,
      address: null,
      isOnline: true,
      isVerified: false,
      locale: data.locale as Locale,
      password: null,
    };
    const existingUser = await this.userService.findByEmail(data.email);
    if (!existingUser) {
      await this.userService.register(payload);
    }
    return this.jwtService.sign(payload, {
      secret: jwtConstants.secret,
    });
  }
}
