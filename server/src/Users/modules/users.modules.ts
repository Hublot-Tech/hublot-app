import { Module } from '@nestjs/common';
import { UsersController } from '../contollers/users.contollers';
import { UserService } from '../services/users.services';
    
@Module({
  imports:[
   ],
  controllers: [UsersController],
  providers: [UserService],
})
export class UsersModule {}