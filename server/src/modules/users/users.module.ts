import { Module } from "@nestjs/common";
import { APP_GUARD } from "@nestjs/core";
import { JwtService } from "@nestjs/jwt";
import { MongooseModule } from "@nestjs/mongoose";
import { AuthGuard } from "../authentication/auth-guard/auth.guard";
import { User, UserSchema } from "./schema/users.schema";
import { UsersController } from "./users.contoller";
import { UserService } from "./users.service";

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
