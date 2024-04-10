import { Module } from "@nestjs/common";
import { UsersController } from "./users.contoller";
import { UserService } from "./users.service";

@Module({
  imports: [],
  controllers: [UsersController],
  providers: [UserService],
})
export class UsersModule {}
