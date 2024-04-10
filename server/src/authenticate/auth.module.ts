import { Module } from "@nestjs/common";
import { PassportModule } from "@nestjs/passport";
import { JwtModule, JwtService } from "@nestjs/jwt";
import { AuthService } from "./auth.service";
import { UsersModule } from "../modules/users/users.module";
import { LocalAuthStrategy } from "./local/local-auth.strategy";
import { AuthController } from "./auth.controller";
import { UserService } from "../modules/users/users.service";
import { constants } from "src/constant";

@Module({
  imports: [
    UsersModule,
    PassportModule,
    JwtModule.register({
      secret: constants.JWT_SECRET,
      signOptions: { expiresIn: "60s" },
    }),
  ],
  providers: [AuthService, JwtService, UserService, LocalAuthStrategy],
  exports: [],
  controllers: [AuthController],
})
export class AuthModule {}
