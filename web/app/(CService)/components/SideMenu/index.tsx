'use client';
import React from 'react';
import { usePathname } from 'next/navigation';
import Image from 'next/image';
import { menuData } from './menuData';
import { Menu } from '@/types/menu';


const index = () => {
  return (
    <div className="flex flex-col w-full px-5 py-3 bg-gray-50 dark:bg-gray-200">
      {menuData.map((menu, index) => (
        <span className='inline-flex  hover:bg-gray-100 dark:hover:bg-gray-800 '>
          <Image
            key={index}
            className='text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white'
            src={`/icons/${menu.icon}.svg`} alt={menu.title} width={20} height={20} 
          />
          <a
            key={menu.id}
            href={menu.path}
            className="flex items-center p-4 font-light text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group"
          >
            {menu.title}
          </a>
        </span>
      ))}
    </div>
  );
};

export default index;
