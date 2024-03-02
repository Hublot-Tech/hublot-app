import { ApiProperty } from "@nestjs/swagger";
import { IsNotEmpty, MinLength } from "class-validator";

export class UserRole {

    @ApiProperty({ description: 'The role Id is required to create a new user role', required: true})  
    @IsNotEmpty({ message: 'Description is required' })
    @MinLength(10, { message: 'Description must be at least 3 characters long' })
    roleId: string;

    @ApiProperty({ description: 'The role Id is required to create a new user role', required: true})  
    @IsNotEmpty({ message: 'User Id  is required' })
     userId: string;
     
}
