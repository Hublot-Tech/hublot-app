import { ApiProperty, OmitType } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import {
  IsArray,
  IsBoolean,
  IsDateString,
  IsEmail,
  IsEnum,
  IsNumber,
  IsPhoneNumber,
  IsString,
  IsUUID,
  MinLength,
  ValidateNested,
} from 'class-validator';

export enum Locale {
  FR = 'fr',
  EN_US = 'en-US',
}

export class CreateUserDto {
  @ApiProperty({
    example: 'Wonder',
    description: 'The name is required to create a new account',
    required: true,
  })
  @IsString({ message: 'Fullname is required' })
  @MinLength(3, { message: 'Name must be at least 3 characters long' })
  fullname: string;

  @ApiProperty({
    example: 'wonder@gmail.com',
    description: 'The name is required to create a new account',
    required: true,
  })
  @IsEmail()
  email: string;

  @ApiProperty({
    example: '237 693 xxx xxx',
    description: 'The phoneNumber is required to create a new account',
    required: true,
  })
  @IsPhoneNumber()
  phoneNumber: string;

  @IsBoolean()
  isVerified: boolean = false;

  @IsBoolean()
  isOnline: boolean = false;

  @ApiProperty({
    example: 'Douala',
    description: 'The locale is required to create a new account',
    required: true,
  })
  @IsEnum(Locale)
  locale: string;

  @ApiProperty({
    example: 'Lobbessou',
    description: 'The address is required to create a new account',
    required: true,
  })
  @IsString()
  address: string;

  @ApiProperty({
    example: 'Hublot@##*(373#@',
    description: 'The name is required to create a new account',
    required: true,
  })
  @IsString()
  @MinLength(3, { message: 'Password must be at least 3 characters long' })
  password: string;
}

export class GetUserByIdDto {
  @ApiProperty({
    example: 'Wonder',
    description: 'The user ID is required to obtain a user account.',
    required: true,
  })
  @IsUUID()
  id: string;
}

export class UpdateUsersDto extends OmitType(CreateUserDto, [
  'password',
  'email',
  'isVerified',
] as const) {}

export class QueryUserDto {
  @ApiProperty()
  @IsNumber()
  perpage: number;

  @ApiProperty()
  @IsNumber()
  page: number;
}

export class UserDto extends CreateUserDto {
  @ApiProperty({
    description: 'Timestamp of last update',
    required: true,
    default: new Date(),
  })
  @IsDateString()
  updatedAt: Date;

  @ApiProperty({
    description: 'Timestamp of creation',
    required: true,
    default: new Date(),
  })
  @IsDateString()
  createdAt: Date;

  @ApiProperty({
    description: 'Timestamp of deletion',
    required: true,
    default: new Date(),
  })
  @IsDateString()
  deletedAt: Date;
}

export class GetAllUsersDto extends QueryUserDto {
  @IsArray()
  @ApiProperty()
  @ValidateNested()
  @Type(() => UserDto)
  users: UserDto[];
}
