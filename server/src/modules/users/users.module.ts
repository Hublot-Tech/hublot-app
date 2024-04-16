import { Module } from "@nestjs/common";
import { UsersController } from "./users.contoller";
import { UserService } from "./users.service";
import { APP_GUARD } from "@nestjs/core";
import { AuthGuard } from "../authentication/auth-guard/auth.guard";
import { JwtService } from "@nestjs/jwt";
import { MongooseModule } from "@nestjs/mongoose";
import { User, UserSchema } from "./shema/users.schema";
import { ConfigModule } from "@nestjs/config";
import configuration from "src/config/configuration";

@Module({
  imports: [
    MongooseModule.forFeature([{ name: User.name, schema: UserSchema }]),
  ],
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
