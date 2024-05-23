'use client';

import {
  TableRow,
  TableBody,
  Table
} from '../../components/ui/atomics/table';

import { useRouter } from 'next/navigation';
import { User } from '@/types/user';

export function UsersTable({
  users,
  offset
}: {
  users: User[];
  offset: number | null;
}) {
  const router = useRouter();

  function onClick() {
    router.replace(`/?offset=${offset}`);
  }

  return (
    <>
      <form className="border shadow-sm rounded-lg">
        <Table>
          <TableBody>
            {users.map((user) => (
              <UserRow key={user.id} user={user} />
            ))}
          </TableBody>
        </Table>
      </form>
      {offset !== null && (
        <button
          className="mt-4 w-40"
          onClick={() => onClick()}
        >
          Next Page
        </button>
      )}
    </>
  );
}

function UserRow({ user }: { user: User }) {

  return (
    <TableRow>
        <div className="">{user.lastname}</div>
    </TableRow>
  );
}
