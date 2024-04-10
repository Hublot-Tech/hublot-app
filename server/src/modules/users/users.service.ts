import { NotImplementedException } from "@nestjs/common";
import {
  CreateUserDto,
  QueryUserDto,
  UpdateUsersDto,
  UserDto,
} from "./dto/users.dto";

export class UserService {
  register(userData: CreateUserDto): Promise<CreateUserDto> {
    throw new NotImplementedException(
      `Method not implemented yet, ${userData}`,
    );
  }

  findOne(userId: number): Promise<UserDto> {
    throw new NotImplementedException(`Method not implemented yet, ${userId}`);
  }

  findByEmail(email: string): Promise<UserDto> {
    throw new NotImplementedException(`Method not implemented yet ${email}`);
  }

  findAll(query: QueryUserDto): Promise<UserDto[]> {
    throw new NotImplementedException(`Method not implemented yet, ${query}`);
  }

  delete(userId: number): Promise<boolean> {
    throw new NotImplementedException(`Method not implemented yet, ${userId}`);
  }

  update(userId: number, data: UpdateUsersDto): Promise<UserDto> {
    throw new NotImplementedException(
      `Method not implemented yet, ${userId}, ${data}`,
    );
  }
}
