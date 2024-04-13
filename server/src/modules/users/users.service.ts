import {
  CreateUserDto,
  GetAllUserResponseDto,
  GetOneUserResponseDto,
  QueryUserDto,
  UpdateUsersDto,
  UserDto,
} from "./dto/users.dto";
import { InjectModel } from "@nestjs/mongoose";
import { Model } from "mongoose";
import { User } from "./shema/users.schema";
import * as bcrypt from "bcrypt";
import { SALT_ROUND } from "../authentication/const/constantes";

export class UserService {
  constructor(
    @InjectModel(User.name) private readonly userModel: Model<User>,
  ) {}

  async register(userData: UserDto): Promise<CreateUserDto> {
    userData.password = await bcrypt.hash(userData.password, SALT_ROUND);
    userData.createdAt = new Date();
    const createdUser = new this.userModel(userData);
    return createdUser.save();
  }

  findOne(userId: number): Promise<GetOneUserResponseDto> {
    return this.userModel
      .findById(userId)
      .exec() as unknown as Promise<GetOneUserResponseDto>;
  }

  findByEmail(email: string): Promise<UserDto> {
    return this.userModel
      .findOne({ email })
      .exec() as unknown as Promise<UserDto>;
  }

  async findAll(query: QueryUserDto): Promise<GetAllUserResponseDto> {
    const count = await this.userModel.countDocuments({}).exec();
    const page_total = Math.ceil(count / (query.limit ?? 10));
    const allUser = (await this.userModel
      .find()
      .limit(query.limit ?? 10)
      .skip(query.page ?? 1)
      .exec()) as unknown as UserDto;

    return {
      data: allUser,
      meta: {
        perpage: page_total,
        page: query.page ?? 1,
        limit: query.limit ?? 10,
      },
      success: true,
    };
  }

  delete(userId: number): Promise<boolean> {
    return this.userModel
      .findByIdAndDelete(userId)
      .exec() as unknown as Promise<boolean>;
  }

  update(userId: number, data: UpdateUsersDto): Promise<UserDto> {
    data.updatedAt = new Date();
    return this.userModel
      .findByIdAndUpdate(userId, data, { new: true })
      .exec() as unknown as Promise<UserDto>;
  }
}
