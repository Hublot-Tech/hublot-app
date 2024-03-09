import {
  Controller,
  Get,
  Query,
  Post,
  Body,
  Put,
  Param,
  Delete,
  ParseIntPipe,
} from '@nestjs/common';
import {
  CreateUsersDto,
  GetAllUserDto,
  UpdateUsersDto,
  UserDto,
} from '../dto/users.dto';
import {
  ApiBadRequestResponse,
  ApiNoContentResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiTags,
} from '@nestjs/swagger';
import { UserService } from '../services/users.services';

@ApiTags('User')
@Controller('user')
export class UsersController {
  constructor(private userService: UserService) {}

  @Post()
  @ApiOkResponse({
    type: GetAllUserDto,
    description: 'Successful user registration',
  })
  register(@Body() createUserDto: CreateUsersDto) {
    const users = this.userService.register(createUserDto);
    return users;
  }

  @Get()
  @ApiOkResponse({
    type: UserDto,
    description: 'list of successfully loaded users',
  })
  findAll(@Query() query: UserDto) {
    const user = this.userService.findAll();
    return user;
  }

  @Get(':id')
  @ApiOkResponse({
    type: UserDto,
    description: 'User information successfully retrieved',
  })
  @ApiNotFoundResponse({ description: 'User not found' })
  @ApiBadRequestResponse({ description: 'Invalid user ID' })
  findOne(@Param('id', ParseIntPipe) id: number) {
    const user = this.userService.findOne(id);
    return user;
  }

  @Put(':id')
  @ApiOkResponse({
    type: GetAllUserDto,
    description: 'The user has been successfully modified',
  })
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() updateUsersDto: UpdateUsersDto,
  ) {
    const user = this.userService.update(id, updateUsersDto);
    return user;
  }

  @Delete(':id')
  @ApiNoContentResponse({
    description: 'User successfully deleted',
  })
  delete(@Param('id', ParseIntPipe) id: number) {
    this.userService.delete(id);
  }
}
