import { CreateUsersDto, UpdateUsersDto, UserDto } from '../dto/users.dto';

export class UserService {
  register(userData: CreateUsersDto): Promise<CreateUsersDto> {
    return;
  }

  findOne(userId: number): Promise<UserDto> {
    return;
  }

  findByEmail(): Promise<UserDto> {
    return;
  }

  findAll(): Promise<UserDto[]> {
    return;
  }

  delete(userId: number): Promise<boolean> {
    return;
  }

  update(userId: number, data: UpdateUsersDto): Promise<UserDto> {
    return;
  }
}
