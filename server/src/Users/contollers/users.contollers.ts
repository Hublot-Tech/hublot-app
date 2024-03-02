import { Controller, Get, Query, Post, Body, Put, Param, Delete, ValidationPipe, HttpException, HttpStatus, ParseIntPipe, Patch, UseGuards } from '@nestjs/common';
import { validate } from 'class-validator';
import { CreateUsersDto, GetAllUserDto, UpdateUsersDto } from '../dto/users.dto';
import {  ApiTags } from '@nestjs/swagger';
import { UserService } from '../services/users.services';
import { LocalAuthGuard } from 'src/authenticate/JWT/local-auth/local-auth.guard';
import { JwtAuthGuard } from 'src/authenticate/JWT/jwt-auth-guard/jwt-auth-guard.guard';
  
@ApiTags('User')
@Controller('user')
export class UsersController {

  constructor(private readonly userService: UserService) {}

  @UseGuards(LocalAuthGuard)
  @Post()
  async create(@Body() createUserDto: CreateUsersDto) {
     return this.userService.userRegister(createUserDto);
  }

  @UseGuards(LocalAuthGuard)
  @Get()
  getAllUsers(@Query() query: GetAllUserDto) {
    return this.userService.getAllUsers();
  }

  @UseGuards(LocalAuthGuard)
  @Get(':id')
  async getUserByIb(@Param('id', ParseIntPipe) id: number ) {
    return this.userService.findUsersById(id)

  }

  @UseGuards(LocalAuthGuard)
  @Put(':id')
  updateUserPut(@Param('id', ParseIntPipe) id: number, @Body() updateUsersDto: UpdateUsersDto) {
    return this.userService.updateUser(id, updateUsersDto)
  }

  @UseGuards(LocalAuthGuard)
  @Patch(':id')
  updateUserPatch(@Param('id', ParseIntPipe) id: number, @Body() updateUsersDto: UpdateUsersDto) {
    return this.userService.updateUser(id, updateUsersDto)
  }

  @UseGuards(LocalAuthGuard)
  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.userService.deleteUser(id)
  }
}