import {
  Controller,
  Get,
  Request,
  Post,
  UseGuards,
  Body,
} from "@nestjs/common";
import { AuthService } from "../authService/auth.service";
import { JwtAuthGuard } from "../JWT/jwt-auth-guard/jwt-auth-guard.guard";
import { AuthenticationDto } from "../dto/AuthenticationDto";
import { ApiTags } from "@nestjs/swagger";
import { LocalAuthGuard } from "../JWT/local-auth/local-auth.guard";

@ApiTags("Login")
@Controller()
export class AuthController {
  constructor(private authService: AuthService) {}

  @UseGuards(LocalAuthGuard)
  @Post("auth/login")
  login(@Body() user: AuthenticationDto) {
    return this.authService.login(user);
  }

  @UseGuards(JwtAuthGuard)
  @Get("profile")
  getProfile(@Request() req) {
    return req.user;
  }
}
