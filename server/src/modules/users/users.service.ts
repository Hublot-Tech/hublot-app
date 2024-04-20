import { InjectModel } from "@nestjs/mongoose";
import * as bcrypt from "bcrypt";
import { Model } from "mongoose";
import { BulkQueryDto } from "../dto/response.dto";
import { CreateUserDto, UpdateUsersDto, UserDto } from "./dto/users.dto";
import { User } from "./schema/users.schema";
import { NotFoundException } from "@nestjs/common";

export class UserService {
  constructor(
    @InjectModel(User.name) private readonly userModel: Model<User>,
  ) {}

  async register(userData: CreateUserDto): Promise<UserDto> {
    const createdUser = await new this.userModel({
      ...userData,
      password: bcrypt.hashSync(
        userData.password,
        parseInt(process.env.SALT_ROUND_DCRIPT),
      ),
    }).save();
    return new UserDto(createdUser.toJSON());
  }

  async findOne(userId: string): Promise<UserDto> {
    const user = await this.userModel.findById(userId).exec();
    return new UserDto(user.toJSON());
  }

  async findByEmail(email: string): Promise<UserDto> {
    const user = await this.userModel.findOne({ email }).exec();
    return new UserDto(user.toJSON());
  }

  async findAll(query: BulkQueryDto): Promise<UserDto[]> {
    const users = await this.userModel
      .find()
      .limit(query.perpage ?? 10)
      .skip(query.page ?? 1)
      .exec();
    return users.map((user) => new UserDto(user.toJSON()));
  }

  async delete(userId: string): Promise<void> {
    const user = await this.userModel.findByIdAndDelete(userId).exec();
    if (!user) throw new NotFoundException(`User with id ${userId} not found`);
  }

  async update(userId: string, data: UpdateUsersDto): Promise<UserDto> {
    const user = await this.userModel
      .findByIdAndUpdate(
        userId,
        { ...data, updatedAt: new Date() },
        { new: true },
      )
      .exec();
    return new UserDto(user.toJSON());
  }
}
