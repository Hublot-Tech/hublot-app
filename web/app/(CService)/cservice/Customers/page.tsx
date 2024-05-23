import React from 'react'
import Filter from '../../components/ui/common/Filter'
import { getUsers } from '@/lib/db';

async function Customers({searchParams}: { searchParams: { q: string; offset: string }}) {
  const search = searchParams.q ?? '';
  const offset = searchParams.offset ?? 0;
  const { users, newOffset } = await getUsers(search, Number(offset));
  return (
    <div className='relative w-full flex '>
      <Filter title='Customers' searchParams={{ q: search }} />
    </div>
  )
}

export default Customers