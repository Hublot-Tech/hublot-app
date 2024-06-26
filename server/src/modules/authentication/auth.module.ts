import { Module } from "@nestjs/common";
import { AuthService } from "./auth.service";
import { UsersModule } from "../users/users.module";
import { JwtModule } from "@nestjs/jwt";
import { AuthController } from "./auth.controller";
import { jwtConstants } from "../../constants/constants";
import { AuthGuard } from "./auth.guard";
import { APP_GUARD } from "@nestjs/core";
import { PassportModule } from "@nestjs/passport";
import { SocialAuthService } from "./google/google-auth.service";

@Module({
  imports: [
    UsersModule,
    JwtModule.register({
      global: true,
      secret: jwtConstants.secret,
      signOptions: { expiresIn: "3600s" },
    }),
    PassportModule,
  ],
  providers: [
    AuthService,
    SocialAuthService,
    {
      provide: APP_GUARD,
      useClass: AuthGuard,
    },
  ],
  controllers: [AuthController],
  exports: [AuthService],
})
export class AuthModule {}
