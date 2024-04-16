import { ApiProperty } from "@nestjs/swagger";
import { IsBoolean, IsDateString, IsEmail, IsString } from "class-validator";

export class SignInDto {
  @ApiProperty({
    description: "Email utilisé pour créer le compte",
    required: true,
  })
  @IsEmail()
  email: string;

  @ApiProperty({
    description: "Password used to create account",
    required: true,
  })
  @IsString()
  password: string;
}

export class UserAuthResponseDto {
  @ApiProperty({
    description: "Valid token",
    required: true,
  })
  @IsDateString()
  accessToken: string;

  @ApiProperty({
    description: "Define authentication status",
    required: true,
  })
  @IsBoolean()
  success: Boolean;
}

export class AuthGoogleLoginDto {
  idToken: string;
}
