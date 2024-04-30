import { ApiProperty, OmitType, PartialType } from "@nestjs/swagger";
import { Type } from "class-transformer";
import {
  IsArray,
  IsBoolean,
  IsDateString,
  IsEmail,
  IsEnum,
  IsOptional,
  IsPhoneNumber,
  IsString,
  IsUUID,
  MinLength,
  ValidateNested,
} from "class-validator";
import { BulkResponseMetadataDto, ResponseMetadataDto } from "../../dto";

export enum Locale {
  FR = "fr",
  EN_US = "en-US",
}

export class CreateUserDto {
  @ApiProperty({
    example: "Wonder",
    description: "The name is required to create a new account",
  })
  @IsString({ message: "Fullname is required" })
  @MinLength(3, { message: "Name must be at least 3 characters long" })
  fullname: string;

  @ApiProperty({
    example: "wonder@gmail.com",
    description: "The name is required to create a new account",
  })
  @IsEmail()
  email: string;

  @ApiProperty({
    example: "237 693 xxx xxx",
    description: "The phoneNumber is required to create a new account",
  })
  @IsPhoneNumber()
  phoneNumber: string;

  @IsBoolean()
  @IsOptional()
  isVerified: boolean = false;

  @IsBoolean()
  @IsOptional()
  isOnline: boolean = true;

  @ApiProperty({
    example: "Douala",
    description: "The locale is required to create a new account",
  })
  @IsEnum(Locale)
  locale: Locale;

  @ApiProperty({
    example: "Lobbessou",
    description: "The address is required to create a new account",
  })
  @IsString()
  address: string;

  @ApiProperty({
    example: "Hublot@##*(373#@",
    description: "The name is required to create a new account",
  })
  @IsString()
  @MinLength(3, { message: "Password must be at least 3 characters long" })
  password: string;

  constructor(createUser: CreateUserDto) {
    Object.assign(this, createUser);
  }
}

export class GetUserByIdDto {
  @ApiProperty({
    example: "Wonder",
    description: "The user ID is required to obtain a user account.",
  })
  @IsUUID()
  id: string;
}

export class UserDto extends CreateUserDto {
  @ApiProperty({
    description: "Timestamp of last update",
  })
  @IsDateString()
  updatedAt: Date;

  @ApiProperty({
    description: "Timestamp of creation",
  })
  @IsDateString()
  createdAt: Date;

  @ApiProperty({
    description: "Timestamp of deletion",
  })
  @IsDateString()
  deletedAt: Date;

  constructor(user: UserDto) {
    super(user);
    Object.assign(this, user);
  }
}

export class UpdateUserDto extends PartialType(
  OmitType(UserDto, ["password", "email", "isVerified"] as const),
) {}

export class RegisterUserResponseDto extends ResponseMetadataDto {
  @ApiProperty()
  @ValidateNested()
  @Type(() => UserDto)
  data: UserDto;

  constructor(responseBody: RegisterUserResponseDto) {
    super(responseBody);
    Object.assign(this, responseBody);
  }
}

export class GetAllUserResponseDto extends BulkResponseMetadataDto {
  @IsArray()
  @ApiProperty()
  @ValidateNested()
  @Type(() => UserDto)
  data: UserDto[];

  constructor(response: GetAllUserResponseDto) {
    super(response);
    Object.assign(this, response);
  }
}

export class GetOneUserResponseDto extends ResponseMetadataDto {
  @ApiProperty()
  @ValidateNested()
  @Type(() => UserDto)
  data: UserDto;

  constructor(response: GetOneUserResponseDto) {
    super(response);
    Object.assign(this, response);
  }
}

export class GoogleSignInDto {
  @ApiProperty({
    description: "Id token",
  })
  @IsString()
  idToken: string;

  @ApiProperty({
    description: "Network used for connection",
  })
  @IsString()
  socialMode: string;
}
