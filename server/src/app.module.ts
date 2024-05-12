import { Module } from "@nestjs/common";
import { AppController } from "./app.controller";
import { AppService } from "./app.service";
import { UsersModule } from "./modules/users/users.module";
import { AuthModule } from "./modules/authentication/auth.module";
import { MongooseModule } from "@nestjs/mongoose";
import { ConfigModule } from "@nestjs/config";
import { ChatModule } from './modules/chat/chat.module';
import { ServiceModule } from './modules/service/service.module';
import { PaymentModule } from './modules/payment/payment.module';
import { OrderModule } from './modules/order/order.module';

@Module({
  imports: [
    UsersModule,
    AuthModule,
    ConfigModule.forRoot({
      isGlobal: true,
    }),

    MongooseModule.forRoot(process.env.DATABASE_HOST),

    ChatModule,

    ServiceModule,

    PaymentModule,

    OrderModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
