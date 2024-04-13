import { Body, Controller, Post, Request, Get } from "@nestjs/common";
import { AuthService } from "./auth.service";
import { SignInDto, UserAuthResponseDto } from "./dto/auth.dto";
import { ApiCreatedResponse } from "@nestjs/swagger";
import { SkipAuth } from "./decorator/metaData";
import { UserService } from "../users/users.service";
import {
  GetOneUserResponseDto,
  SocialAuthDto,
  UserDto,
  UserRegisterDto,
} from "../users/dto/users.dto";
import { SocialAuthService } from "./social-auth/social-auth.service";

@Controller("auth")
export class AuthController {
  constructor(
    private authService: AuthService,
    private userService: UserService,
    private authGuard: SocialAuthService,
  ) {}

  @ApiCreatedResponse({
    type: UserAuthResponseDto,
    description: "Successful user registration",
  })
  @SkipAuth()
  @Post("login")
  signIn(@Body() signInDto: SignInDto) {
    return this.authService.signIn(signInDto.email, signInDto.password);
  }

  @ApiCreatedResponse({
    type: UserAuthResponseDto,
    description: "Successful user registration",
  })
  @SkipAuth()
  @Post("social-auth")
  socialAuth(@Body() signInDto: SocialAuthDto) {
    return this.authGuard.getProfileByToken(signInDto);
  }

  @Get("profile")
  @ApiCreatedResponse({
    type: GetOneUserResponseDto,
    description: "Successful user registration",
  })
  async getProfile(@Request() req) {
    let user = req.user;
    user.isOnline = true;
    let authUser = await this.userService.update(user._id, user);

    return {
      data: authUser,
      success: true,
    };
  }

  @SkipAuth()
  @Post("register")
  @ApiCreatedResponse({
    type: UserRegisterDto,
    description: "Successful user registration",
  })
  async register(@Body() createUserDto: UserDto) {
    try {
      const users = await this.userService.register(createUserDto);
      return {
        data: users,
        success: true,
      };
    } catch (error) {
      return {
        message: error.message,
        success: false,
      };
    }
  }
}
