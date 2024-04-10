import { Module } from "@nestjs/common";
import { AppController } from "./app.controller";
import { AppService } from "./app.service";
import { UsersModule } from "./modules/users/users.module";
import { RoleModule } from "./role/module/role.module";
import { UserRoleModule } from "./user-role/user-role.module";
import { AuthModule } from "./authenticate/auth.module";

@Module({
  imports: [UsersModule, AuthModule, RoleModule, UserRoleModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
