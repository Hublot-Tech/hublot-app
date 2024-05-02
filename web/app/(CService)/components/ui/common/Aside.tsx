import React from 'react'
import SideMenu from '../../SideMenu'
import Image from 'next/image'

const Aside = () => {
  
  return (
    <aside id="default-sidebar" className="fixed top-0 left-0 z-40 w-64 h-screen transition-transform -translate-x-full sm:translate-x-0" aria-label="Sidebar">
      <div id="menu-head" className='flex items-center justify-center text-center text-primary  h-24'>C.service</div>
      <div id="menu" className="h-full overflow-y-auto bg-gray-50 dark:bg-gray-800">
        <SideMenu />
      </div>
      <div className="w-full h-24 fixed bottom-0 text-gray-900">
        <div className="px-3 flex flex-col">
          <div id="profile" className='inline-flex'>
            <img src="/images/user.png" alt="profile" className="w-10 h-10 rounded-full" />
            <div id='profile-details' className="ml-2 flex flex-col">
              <span className="text-sm font-sans font-bold">Belrick Stephane</span>
              <span className="text-xs">Admin</span>
            </div>
          </div>
        </div>
        <div id="logout-link" className='flex items-center m-4 p-2'>
          
          <a href="/logout" className="inline-flex font-semibold">
            <Image src="/icons/logout.svg" alt='' width={20} height={17} className='mr-5' />
            <span className='text-sm'>Log out</span>  
          </a>
        </div>
      </div>
    </aside>
  )
};

export default Aside