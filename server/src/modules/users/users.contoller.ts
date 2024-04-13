import {
  Body,
  Controller,
  Delete,
  Get,
  NotFoundException,
  Param,
  ParseIntPipe,
  Put,
  Query,
} from "@nestjs/common";
import {
  ApiBadRequestResponse,
  ApiNoContentResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiTags,
} from "@nestjs/swagger";
import {
  GetAllUserResponseDto,
  GetOneUserResponseDto,
  QueryUserDto,
  UpdateUsersDto,
} from "./dto/users.dto";
import { UserService } from "./users.service";

@ApiTags("User")
@Controller("user")
export class UsersController {
  constructor(private userService: UserService) {}

  @Get()
  @ApiOkResponse({
    type: GetAllUserResponseDto,
    description: "list of successfully loaded users",
  })
  async findAll(@Query() query: QueryUserDto) {
    const user = await this.userService.findAll(query);
    return user;
  }

  @Get(":id")
  @ApiOkResponse({
    type: GetOneUserResponseDto,
    description: "User information successfully retrieved",
  })
  @ApiNotFoundResponse({ description: "User not found" })
  @ApiBadRequestResponse({ description: "Invalid user ID" })
  async findOne(@Param("id") id: any) {
    try {
      const user = await this.userService.findOne(id);

      return {
        data: user,
        success: true,
      };
    } catch (error) {
      return {
        message: `User with id ${id} not found!`,
        success: false,
        error: error,
      };
    }
  }

  @Put(":id")
  @ApiOkResponse({
    type: GetOneUserResponseDto,
    description: "The user has been successfully modified",
  })
  async update(
    @Param("id", ParseIntPipe) id: number,
    @Body() updateUsersDto: UpdateUsersDto,
  ) {
    try {
      const user = await this.userService.update(id, updateUsersDto);
      return user;
    } catch (error) {
      return {
        message: `the user with this id:${id} could not be edited`,
        success: false,
        error: error,
      };
    }
  }

  @Delete(":id")
  @ApiNoContentResponse({
    description: "User successfully deleted",
  })
  async delete(@Param("id") id: any) {
    const deletedUser = await this.userService.delete(id);
    if (!deletedUser) {
      throw new NotFoundException(`User with id ${id} not found`);
    }
  }
}
