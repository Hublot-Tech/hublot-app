import { ApiProperty, OmitType } from '@nestjs/swagger';
import {
  IsBoolean,
  IsEmail,
  IsInt,
  IsNotEmpty,
  IsString,
  IsUUID,
  MinLength,
} from 'class-validator';

export class CreateUsersDto {
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
  @IsNotEmpty({ message: 'Email is required' })
  @IsEmail()
  email: string;

  @ApiProperty({
    example: '237 693 xxx xxx',
    description: 'The phoneNumber is required to create a new account',
    required: true,
  })
  @IsNotEmpty({ message: 'phoneNumber is required' })
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
  @IsNotEmpty({ message: 'locale is required' })
  local: string;

  @ApiProperty({
    example: 'Lobbessou',
    description: 'The address is required to create a new account',
    required: true,
  })
  @IsNotEmpty({ message: 'address is required' })
  address: string;

  @ApiProperty({
    example: 'Hublot@##*(373#@',
    description: 'The name is required to create a new account',
    required: true,
  })
  @IsNotEmpty({ message: 'Password is required' })
  @MinLength(3, { message: 'Password must be at least 3 characters long' })
  password: string;
}

export class GetUserByIdDto {
  @ApiProperty({
    example: 'Wonder',
    description: 'The user ID is required to obtain a user account.',
    required: true,
  })
  @IsNotEmpty({ message: 'ID is required' })
  @IsInt({ message: 'ID must be an integer' })
  @IsUUID()
  id: string;
}

export class UpdateUsersDto extends OmitType(CreateUsersDto, [
  'password',
  'email',
  'isVerified',
] as const) {}

export class UserDto {
  @ApiProperty({
    example: 'Wonder',
    description: 'User fullname',
    required: true,
  })
  fullname: string;

  @ApiProperty({
    example: 'wonder@gmail.com',
    description: 'User email',
    required: true,
  })
  email: string;

  @ApiProperty({
    example: '237 693 xxx xxx',
    description: 'User phone number',
    required: true,
  })
  phoneNumber: string;

  @ApiProperty({
    example: true,
    description: 'User verification status',
    default: false,
  })
  isVerified: boolean;

  @ApiProperty({
    example: true,
    description: 'User online status',
    default: false,
  })
  isOnline: boolean;

  @ApiProperty({
    example: 'Douala',
    description: 'Local information for account creation',
    required: true,
  })
  local: string;

  @ApiProperty({
    example: 'Lobbessou',
    description: 'User address for account creation',
    required: true,
  })
  address: string;

  @ApiProperty({
    example: 'Hublot@##*(373#@',
    description: 'User password',
    required: true,
  })
  password: string;

  @ApiProperty({
    description: 'Timestamp of last update',
    required: true,
    default: new Date(),
  })
  updated_at: Date;

  @ApiProperty({
    description: 'Timestamp of creation',
    required: true,
    default: new Date(),
  })
  created_at: Date;

  @ApiProperty({
    description: 'Timestamp of deletion',
    required: true,
    default: new Date(),
  })
  deleted_at: Date;
}

export class GetAllUserDto extends OmitType(UserDto, ['password'] as const) {}
