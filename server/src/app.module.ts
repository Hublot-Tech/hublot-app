import { Module } from "@nestjs/common";
import { AppController } from "./app.controller";
import { AppService } from "./app.service";
import { UsersModule } from "./modules/users/users.module";
import { AuthModule } from "./modules/authentication/auth.module";
import { MongooseModule } from "@nestjs/mongoose";

@Module({
  imports: [
    UsersModule,
    AuthModule,
    MongooseModule.forRoot("mongodb://localhost:27017/hublot"),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
