import { CreateUsersDto, UserDto } from "../dto/users.dto";

 
 
export class UserService {


    //register
    userRegister(userData: CreateUsersDto): CreateUsersDto{
        return userData
    }

    findUsersById(userId: number): UserDto{
        return 
    }

    getAllUsers(): UserDto[]{
        return [];
    }

    deleteUser(userId: number): boolean {
        return false;
    }


    updateUser(userId: number, data: UserDto): any {
         return UserDto;
    }



}