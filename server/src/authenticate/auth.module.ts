import { Module } from '@nestjs/common';
  import { PassportModule } from '@nestjs/passport';
import { JwtModule, JwtService } from '@nestjs/jwt';
 import { AuthService } from './authService/auth.service';
import { UsersModule } from 'src/Users/modules/users.modules';
import { jwtConstants } from './JWT/Constances/jwtConstance';
import { LocalStrategy } from './JWT/local.strategy';
import { AuthController } from './controllers/auth.controller';
import { UserService } from 'src/Users/services/users.services';
 
@Module({
    imports: [
      UsersModule,
      PassportModule,
      JwtModule.register({
        secret: jwtConstants.secret,
        signOptions: { expiresIn: '60s' },
      }),
    ],
    providers: [AuthService, JwtService, UserService, LocalStrategy],
    exports: [],
    controllers: [AuthController]
  })
  export class AuthModule {

}
