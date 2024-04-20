import {
  Body,
  Controller,
  Delete,
  Get,
  HttpException,
  HttpStatus,
  Param,
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
  UpdateUsersDto,
} from "./dto/users.dto";
import { UserService } from "./users.service";
import { BulkQueryDto, ResponseMetadataDto, ResponseStatus } from "../dto";

@ApiTags("User")
@Controller("user")
export class UsersController {
  constructor(private userService: UserService) {}

  @Get()
  @ApiOkResponse({
    type: GetAllUserResponseDto,
    description: "list of successfully loaded users",
  })
  async findAll(@Query() query: BulkQueryDto): Promise<GetAllUserResponseDto> {
    const users = await this.userService.findAll(query);
    return new GetAllUserResponseDto({
      data: users,
      page: query.page ?? 1,
      perpage: query.perpage ?? 10,
      status: ResponseStatus.SUCCESS,
      message: "Successfully retrieved users",
    });
  }

  @Get(":id")
  @ApiOkResponse({
    type: GetOneUserResponseDto,
    description: "User information successfully retrieved",
  })
  @ApiNotFoundResponse({ description: "User not found" })
  @ApiBadRequestResponse({ description: "Invalid user ID" })
  async findOne(@Param("id") userId: any): Promise<GetOneUserResponseDto> {
    try {
      const user = await this.userService.findOne(userId);

      return new GetOneUserResponseDto({
        data: user,
        message: "Successfully retrieved user",
        status: ResponseStatus.SUCCESS,
      });
    } catch (error) {
      throw new HttpException(
        new ResponseMetadataDto({
          message: error.message,
          status: ResponseStatus.ERROR,
        }),
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  @Put(":id")
  @ApiOkResponse({
    type: GetOneUserResponseDto,
    description: "The user has been successfully modified",
  })
  async update(
    @Param("id") userId: string,
    @Body() updateUsersDto: UpdateUsersDto,
  ): Promise<GetOneUserResponseDto> {
    try {
      const user = await this.userService.update(userId, updateUsersDto);
      return new GetOneUserResponseDto({
        data: user,
        message: "Successfully retrieved user",
        status: ResponseStatus.SUCCESS,
      });
    } catch (error) {
      throw new HttpException(
        new ResponseMetadataDto({
          message: error.message,
          status: ResponseStatus.ERROR,
        }),
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  @Delete(":id")
  @ApiNoContentResponse({
    type: ResponseMetadataDto,
    description: "User successfully deleted",
  })
  async delete(@Param("id") userId: string): Promise<ResponseMetadataDto> {
    try {
      await this.userService.delete(userId);
      return new ResponseMetadataDto({
        message: "Successfully deleted user",
        status: ResponseStatus.ERROR,
      });
    } catch (error) {
      throw new HttpException(
        new ResponseMetadataDto({
          message: error.message,
          status: ResponseStatus.ERROR,
        }),
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }
}
