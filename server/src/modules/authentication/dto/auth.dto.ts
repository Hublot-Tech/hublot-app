import { ApiProperty } from "@nestjs/swagger";
import { IsEmail, IsJWT, IsString } from "class-validator";
import { ResponseMetadataDto } from "src/modules/dto";

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

export class SignInResponseDto extends ResponseMetadataDto {
  @ApiProperty({
    description: "Valid access token",
    required: true,
  })
  @IsJWT()
  accessToken: string;

  constructor(responseBody: SignInResponseDto) {
    super(responseBody);
    Object.assign(this, responseBody);
  }
}

export class AuthGoogleLoginDto {
  idToken: string;
}
