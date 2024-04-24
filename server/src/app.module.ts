import { Module } from "@nestjs/common";
import { AppController } from "./app.controller";
import { AppService } from "./app.service";
import { UsersModule } from "./modules/users/users.module";
import { AuthModule } from "./modules/authentication/auth.module";
import { MongooseModule } from "@nestjs/mongoose";
import { ConfigModule } from "@nestjs/config";
import { HublotsModule } from "./modules/hublots/hublots.module";

@Module({
  imports: [
    UsersModule,
    AuthModule,
    HublotsModule,
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    MongooseModule.forRoot(process.env.DATABASE_HOST),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
