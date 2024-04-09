import { Module } from "@nestjs/common";
import { UsersController } from "./users.contoller";
import { UserService } from "./users.service";
import { APP_GUARD } from "@nestjs/core";
import { AuthGuard } from "../authentication/authGuard/auth.guard";
import { JwtService } from "@nestjs/jwt";

@Module({
  imports: [],
  controllers: [UsersController],
  providers: [
    UserService,
    {
      provide: APP_GUARD,
      useClass: AuthGuard,
    },
    JwtService,
  ],
  exports: [UserService],
})
export class UsersModule {}
