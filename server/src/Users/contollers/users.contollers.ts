import { Controller, Get, Query, Post, Body, Put, Param, Delete, ValidationPipe, HttpException, HttpStatus, ParseIntPipe, Patch } from '@nestjs/common';
import { validate } from 'class-validator';
import { CreateUsersDto, GetAllUserDto, UpdateUsersDto } from '../dto/users.dto';
import { ApiOkResponse, ApiTags } from '@nestjs/swagger';
  
@ApiTags('User')
@Controller('user')
export class UsersController {
    
  @Post()
  
  async create(@Body() createUserDto: CreateUsersDto) {
     return createUserDto;
  }

  @Get()
  getAllUsers(@Query() query: GetAllUserDto) {
    return `This action returns all cats`;
  }

  @Get(':id')
  async getUserByIb( @Param('id', ParseIntPipe) id: number ) {
     return `This action returns a #${id} cat`;
  }

  @Put(':id')
  updateUserPut(@Param('id', ParseIntPipe) id: number, @Body() updateUsersDto: UpdateUsersDto) {
    return `This action updates a #${id} cat`;
  }

  @Patch(':id')
  updateUserPatch(@Param('id', ParseIntPipe) id: number, @Body() updateUsersDto: UpdateUsersDto) {
    return `This action updates a #${id} cat`;
  }

  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number) {
    return `This action removes a #${id} cat`;
  }
}