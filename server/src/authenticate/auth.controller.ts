import {
  Controller,
  Get,
  Request,
  Post,
  UseGuards,
  Body,
} from "@nestjs/common";
import { AuthService } from "./auth.service";
import { JwtAuthGuard } from "./jwt-auth/jwt-auth-guard/jwt-auth-guard.guard";
import { AuthenticationDto } from "./dto/AuthenticationDto";
import { ApiTags } from "@nestjs/swagger";
import { LocalAuthGuard } from "./local/local-auth.guard";

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
