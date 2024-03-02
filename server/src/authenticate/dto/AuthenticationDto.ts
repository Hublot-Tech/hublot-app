import { ApiProperty } from "@nestjs/swagger";
import { IsEmail, IsNotEmpty } from "class-validator";

export class AuthenticationDto {

    @ApiProperty({ description: 'The name is required to login', required: true })
    @IsNotEmpty({ message: 'Email is required' })
    @IsEmail()
    email: string;

    @ApiProperty({ description: 'The password is required to login', required: true })
    @IsNotEmpty()
    @IsNotEmpty({ message: 'password is required' })
    password: string;

}