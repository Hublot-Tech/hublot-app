import {
  Body,
  Controller,
  Post,
  Request,
  UseGuards,
  Get,
} from "@nestjs/common";
import { AuthService } from "./auth.service";
import { SignInDto, UserAuthResponseDto } from "./dto/auth.dto";
import { ApiCreatedResponse } from "@nestjs/swagger";
import { AuthGuard } from "./authGuard/auth.guard";
import { SkipAuth } from "./decorator/metaData";

@Controller("auth")
export class AuthController {
  constructor(private authService: AuthService) {}

  @ApiCreatedResponse({
    type: UserAuthResponseDto,
    description: "Successful user registration",
  })
  // @UseGuards(new AuthGuard('local'))
  @Post("login")
  signIn(@Body() signInDto: SignInDto) {
    return this.authService.signIn(signInDto.email, signInDto.password);
  }

  @SkipAuth()
  @UseGuards(AuthGuard)
  @Get("profile")
  getProfile(@Request() req) {
    return req.user;
  }
}
