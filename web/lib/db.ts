import { User } from "@/types/user"
import { userData } from "@/app/(CService)/components/Customers/userData"

export function getUsers(users: string, offset: number) {

  const list : User[] = userData.filter((user: User) => {
    return user.firstname.includes(users)
  })

  if (offset === null){
    return {users: [], newOffset:  null}
  }

  return {users: list.slice(offset, offset + 10), newOffset: offset + 10}
}

export type SelectUser = [User]


