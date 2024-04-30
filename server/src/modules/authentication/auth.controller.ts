import {
  Body,
  Controller,
  Get,
  HttpException,
  HttpStatus,
  Post,
  Req,
  UseGuards,
} from "@nestjs/common";
import { ApiCreatedResponse, ApiTags } from "@nestjs/swagger";
import { ResponseMetadataDto, ResponseStatus } from "../dto";
import {
  GetOneUserResponseDto,
  RegisterUserResponseDto,
  GoogleSignInDto,
  UserDto,
} from "../users/dto/users.dto";
import { UserService } from "../users/users.service";
import { AuthGuard } from "./auth.guard";
import { AuthService } from "./auth.service";
import { SignInDto, SignInResponseDto } from "./dto/auth.dto";
import { SocialAuthService } from "./google/google-auth.service";

@ApiTags("Auth")
@Controller("auth")
export class AuthController {
  constructor(
    private authService: AuthService,
    private userService: UserService,
    private authGuard: SocialAuthService,
  ) {}

  @ApiCreatedResponse({
    type: SignInResponseDto,
    description: "Successfully signed user in",
  })
  @Post("login")
  async signIn(@Body() signInDto: SignInDto): Promise<SignInResponseDto> {
    const accessToken = await this.authService.signIn(
      signInDto.email,
      signInDto.password,
    );
    return new SignInResponseDto({
      accessToken,
      message: "Successfully signed user in",
      status: ResponseStatus.SUCCESS,
    });
  }

  @ApiCreatedResponse({
    type: SignInResponseDto,
    description: "Successful user registration",
  })
  @Post("google-login")
  async googleSignIn(
    @Body() signInDto: GoogleSignInDto,
  ): Promise<SignInResponseDto> {
    const accessToken = await this.authGuard.getProfileByToken(signInDto);
    return new SignInResponseDto({
      accessToken,
      message: "Successfully signed user in",
      status: ResponseStatus.SUCCESS,
    });
  }

  @Get("profile")
  @UseGuards(AuthGuard)
  @ApiCreatedResponse({
    type: GetOneUserResponseDto,
    description: "Successful user registration",
  })
  async getProfile(@Req() req): Promise<GetOneUserResponseDto> {
    const authUser = await this.userService.update(req.user._id, {
      isOnline: true,
    });
    return new GetOneUserResponseDto({
      data: authUser,
      message: "Successfully retrieved user profile",
      status: ResponseStatus.SUCCESS,
    });
  }

  @Post("register")
  @ApiCreatedResponse({
    type: RegisterUserResponseDto,
    description: "Successful user registration",
  })
  async register(
    @Body() createUserDto: UserDto,
  ): Promise<RegisterUserResponseDto> {
    try {
      const users = await this.userService.register(createUserDto);
      return new RegisterUserResponseDto({
        data: users,
        status: ResponseStatus.SUCCESS,
        message: "Successfully  register user",
      });
    } catch (error) {
      throw new HttpException(
        new ResponseMetadataDto({
          message: error.message,
          status: ResponseStatus.ERROR,
        }),
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }
}
