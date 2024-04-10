import { Module } from "@nestjs/common";
import { RoleService } from "../services/role.service";
import { RoleController } from "../controllers/role.controller";

@Module({
  controllers: [RoleController],
  providers: [RoleService],
})
export class RoleModule {}
