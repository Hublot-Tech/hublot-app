import { Optional } from "@nestjs/common";
import { ApiOkResponse, ApiProperty } from "@nestjs/swagger";
import { IsDate, IsDefined, IsEmail, IsInt, IsNotEmpty, IsNumber, IsNumberString, IsPositive, Length, MinLength } from "class-validator";

 
export class CreateUsersDto {

    @ApiProperty({ description: 'The name is required to create a new account', required: true})  
    @IsNotEmpty()
    @IsNotEmpty({ message: 'Fullname is required' })
    @MinLength(3, { message: 'Name must be at least 3 characters long' })
    fullname: string;

    @ApiProperty({ description: 'The name is required to create a new account' , required: true})
    @IsNotEmpty({ message: 'Email is required' })
     @IsEmail()
    email: string;

    @ApiProperty({ description: 'The phoneNumber is required to create a new account' , required: true})
    @IsNotEmpty()
    @IsNotEmpty({ message: 'phoneNumber is required' })
     phoneNumber: string;

    @ApiProperty({ description: 'isVerified is false default' })
    @IsNotEmpty()
    isVerified: boolean = false;

    @ApiProperty({ description: 'isOnline is false default' })
    @IsNotEmpty()
      isOnline: boolean = false;

    @ApiProperty({ description: 'The local is required to create a new account', required: true })
     @IsNotEmpty({ message: 'local is required' })
     local: string;

    @ApiProperty({ description: 'The address is required to create a new account', required: true })
    @IsNotEmpty()
    @IsNotEmpty({ message: 'address is required' })
     address: string;


    @ApiProperty({ description: 'The name is required to create a new account', required: true })
    @IsNotEmpty({ message: 'Password is required' })
    @MinLength(3, { message: 'Password must be at least 3 characters long' })
    password: string;
}

export class GetUserByIdDto{

    @ApiProperty({ description: 'The user ID is required to obtain a user account.', required: true })
    @IsNotEmpty({ message: 'ID is required' })
    @IsInt({ message: 'ID must be an integer' })
    @IsNumberString()
    id: number;

}


export class UpdateUsersDto {
    @ApiProperty({ description: 'The name value is Optional', required: false})  
    @Optional()
     @MinLength(3, { message: 'Name must be at least 3 characters long' })
    fullname: string;

    @ApiProperty({ description: 'The name value is Optional' , required: false})
    @Optional()     @IsEmail()
    email: string;

    @ApiProperty({ description: 'The phoneNumber value is Optional' , required: false})
    @Optional()
      phoneNumber: string;

    @ApiProperty({ description: 'The local value is Optional', required: false })
     @IsNotEmpty({ message: 'local is required' })
     local: string;

    @ApiProperty({ description: 'The address value is Optional', required: false })
    @IsNotEmpty()
    @IsNotEmpty({ message: 'address is required' })
     address: string;

}

export class GetAllUserDto{
    user: CreateUsersDto;
    limit: number;
}


export class UserDto {
    name: string;
    email: string;
    birth: Date;
    password: string;
    created_at:Date;
    updated_at:Date;
    deleted_at:Date;

}

 