import { Controller, Get, Query, Post, Body, Put, Param, Delete, ParseIntPipe } from '@nestjs/common';
import { CreateUsersDto, GetAllUserDto, UpdateUsersDto, UserDto } from '../dto/users.dto';
import { ApiBadRequestResponse, ApiNoContentResponse, ApiNotFoundResponse, ApiOkResponse, ApiTags } from '@nestjs/swagger';
import { UserService } from '../services/users.services';

@ApiTags('User')
@Controller('user')
export class UsersController {

  constructor(private userService: UserService) { }

  @Post()
  @ApiOkResponse({
    type: GetAllUserDto, description: 'Successful user registration',
    content: {
      'application/json': {
        schema: {
          type: 'objet',
          items: { $ref: '#/components/schemas/UserDto' },
        },
      },
    },

    links: {
      LinkToGetAllUser: {
        operationId: 'register',
        description: 'Link to register user',
      },
    },
    status: 201,
    headers: {
      Link: {
        description: 'http://localhost:3000/user',
        schema: {
          type: 'string',
        },
      },
      Authorization: {
        description: 'Bearer token for authentication',
        schema: {
          type: 'string',
        },
      },
    }
  })
  register(@Body() createUserDto: CreateUsersDto) {
    const users = this.userService.register(createUserDto);
    return users;
  }

  @Get()
  @ApiOkResponse({
    type: UserDto, isArray: true, description: 'Link to get all user',
    content: {
      'application/json': {
        schema: {
          type: 'objet',
          items: { $ref: '#/components/schemas/UserDto' },
        },
      },
    },

    links: {
      LinkToFindAllUser: {
        operationId: 'findAll',
        description: 'Link to get all users',
      },
    },
    status: 200,
    headers: {
      Link: {
        description: 'http://localhost:3000/user',
        schema: {
          type: 'string',
        },
      },
      Authorization: {
        description: 'Bearer token for authentication',
        schema: {
          type: 'string',
        },
      },
    }
  })
  findAll(@Query() query: UserDto) {
    const user = this.userService.findAll();
    return user
  }

  @Get(':id')
  @ApiOkResponse({
    type: UserDto,
    content: {
      'application/json': {
        schema: {
          type: 'objet',
          items: { $ref: '#/components/schemas/UserDto' },
        },
      },
    },

    links: {
      LinkToFindOneUser: {
        operationId: 'findOne',
        parameters: { id: 'path.id' },
        description: 'Link to get a user',
      },
    },
    description: 'User information successfully retrieved',
    status: 200,
    headers: {
      Link: {
        description: 'http://localhost:3000/user/1',
        schema: {
          type: 'string',
        },
      },
      Authorization: {
        description: 'Bearer token for authentication',
        schema: {
          type: 'string',
        },
      },
    }
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
    content: {
      'application/json': {
        schema: {
          type: 'objet',
          items: { $ref: '#/components/schemas/UserDto' },
        },
      },
    },

    links: {
      LinkToUpdateOneUser: {
        operationId: 'update',
        parameters: { id: 'path.id' },
        description: 'Link to the modified user',
      },
    }

    , description: 'The user has been successfully modified', status: 200, headers: {
      Link: {
        description: 'http://localhost:3000/user/1',
        schema: {
          type: 'string',
        },
      },
      Authorization: {
        description: 'Bearer token for authentication',
        schema: {
          type: 'string',
        },
      },
    }
  })
  update(@Param('id', ParseIntPipe) id: number, @Body() updateUsersDto: UpdateUsersDto) {
    const user = this.userService.update(id, updateUsersDto);
    return user;
  }

  @Delete(':id')
  @ApiNoContentResponse({
    description: 'User successfully deleted', headers: {
      Link: {
        description: 'http://localhost:3000/user/1',
        schema: {
          type: 'string',
        },
      },
      Authorization: {
        description: 'Bearer token for authentication',
        schema: {
          type: 'string',
        },
      },
    },
    content: {
      'application/json': {
        schema: {
          type: 'objet',
          items: { $ref: '#/components/schemas/UserDto' },
        },
        example: {
          message: 'User successfully deleted'
        }
      },
    },

    links: {
      LinkToDeleteUser: {
        operationId: 'delete',
        parameters: { id: 'path.id' },
        description: 'Link to the delete user',
      },
    }
  })
  delete(@Param('id', ParseIntPipe) id: number) {
    this.userService.delete(id);
  }

}