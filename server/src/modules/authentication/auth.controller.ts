import { Body, Controller, Post, Request, Get } from "@nestjs/common";
import { AuthService } from "./auth.service";
import { SignInDto, UserAuthResponseDto } from "./dto/auth.dto";
import { ApiCreatedResponse } from "@nestjs/swagger";
import { AuthGuard } from "./auth-guard/auth.guard";
import { SkipAuth } from "./decorator/metaData";
import { UserService } from "../users/users.service";
import {
  GetOneUserResponseDto,
  UserDto,
  UserRegisterDto,
} from "../users/dto/users.dto";

@Controller("auth")
export class AuthController {
  constructor(
    private authService: AuthService,
    private userService: UserService,
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
