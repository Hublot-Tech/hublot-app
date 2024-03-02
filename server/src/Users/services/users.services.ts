import { CreateUsersDto, UpdateUsersDto, UserDto } from "../dto/users.dto";
import { UserInterface } from "../interfaces/userInterface";

 
 
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


    updateUser(userId: number, data: UpdateUsersDto): any {
         return UserDto;
    }

    findUsersByEmail(email:string): UserInterface {
        return {} as UserInterface;
    }



}