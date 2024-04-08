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
  locale: string;

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

export class UserDto extends CreateUsersDto {
  @ApiProperty({
    description: 'Timestamp of last update',
    required: true,
    default: new Date(),
  })
  updatedAt: Date;

  @ApiProperty({
    description: 'Timestamp of creation',
    required: true,
    default: new Date(),
  })
  createdAt: Date;

  @ApiProperty({
    description: 'Timestamp of deletion',
    required: true,
    default: new Date(),
  })
  deletedAt: Date;
}

export class GetAllUserDto {
  users: UserDto[]
}
