import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  ParseIntPipe,
  Post,
  Put,
  Query,
} from "@nestjs/common";
import {
  ApiBadRequestResponse,
  ApiCreatedResponse,
  ApiNoContentResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiTags,
} from "@nestjs/swagger";
import {
  CreateUserDto,
  GetAllUsersDto,
  QueryUserDto,
  UpdateUsersDto,
  UserDto,
} from "./dto/users.dto";
import { UserService } from "./users.service";

@ApiTags("User")
@Controller("user")
export class UsersController {
  constructor(private userService: UserService) {}

  @Post()
  @ApiCreatedResponse({
    type: GetAllUsersDto,
    description: "Successful user registration",
  })
  register(@Body() createUserDto: CreateUserDto) {
    const users = this.userService.register(createUserDto);
    return users;
  }

  @Get()
  @ApiOkResponse({
    type: UserDto,
    description: "list of successfully loaded users",
  })
  findAll(@Query() query: QueryUserDto) {
    const user = this.userService.findAll(query);
    return user;
  }

  @Get(":id")
  @ApiOkResponse({
    type: UserDto,
    description: "User information successfully retrieved",
  })
  @ApiNotFoundResponse({ description: "User not found" })
  @ApiBadRequestResponse({ description: "Invalid user ID" })
  findOne(@Param("id", ParseIntPipe) id: number) {
    const user = this.userService.findOne(id);
    return user;
  }

  @Put(":id")
  @ApiOkResponse({
    type: GetAllUsersDto,
    description: "The user has been successfully modified",
  })
  update(
    @Param("id", ParseIntPipe) id: number,
    @Body() updateUsersDto: UpdateUsersDto,
  ) {
    const user = this.userService.update(id, updateUsersDto);
    return user;
  }

  @Delete(":id")
  @ApiNoContentResponse({
    description: "User successfully deleted",
  })
  delete(@Param("id", ParseIntPipe) id: number) {
    this.userService.delete(id);
  }
}
