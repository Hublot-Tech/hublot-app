import { ApiProperty } from "@nestjs/swagger";
import { IsNotEmpty, MinLength } from "class-validator";

export class CreateRoleDto {
  @ApiProperty({
    description: "The name is required to create a new a new user role",
    required: true,
  })
  @IsNotEmpty()
  @IsNotEmpty({ message: "Name is required" })
  @MinLength(3, { message: "Name must be at least 3 characters long" })
  name: string;

  @ApiProperty({
    description: "The description is required to create a new user role",
    required: true,
  })
  @IsNotEmpty()
  @IsNotEmpty({ message: "Description is required" })
  @MinLength(10, { message: "Description must be at least 3 characters long" })
  description: string;

  @ApiProperty({
    description: "The User Id is required to create a new user role",
    required: true,
  })
  @IsNotEmpty()
  @IsNotEmpty({ message: "User Id  is required" })
  userId: string;
}
