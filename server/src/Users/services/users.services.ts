import { CreateUsersDto, UpdateUsersDto, UserDto } from "../dto/users.dto";

export class UserService {
    
    register(userData: CreateUsersDto): CreateUsersDto{
        return userData
    }

    findOne(userId: number): UserDto{
        return 
    }

    findByEmail(): UserDto{
        return
    }

    findAll(): UserDto[]{
        return [];
    }

    delete(userId: number): boolean {
        return false;
    }

    update(userId: number, data: UpdateUsersDto): any {
         return UserDto;
    }

}