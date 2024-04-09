import { ApiProperty } from "@nestjs/swagger";
import { IsDateString } from "class-validator";

export class SignInDto {
  @ApiProperty({
    description: "Email utilisé pour créer le compte",
    required: true,
  })
  @IsDateString()
  email: string;

  @ApiProperty({
    description: "Password used to create account",
    required: true,
  })
  @IsDateString()
  password: string;
}

export class UserAuthResponseDto {
  @ApiProperty({
    description: "Valid token",
    required: true,
  })
  @IsDateString()
  token: string;

  @ApiProperty({
    description: "Token expiry date",
    required: true,
  })
  @IsDateString()
  token_expired_at: Date;
}
