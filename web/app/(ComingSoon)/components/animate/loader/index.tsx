import React from 'react'
import Spinloader from './Spinloader'

function Loader() {
  return (
    <div className='relative flex justify-center top-0 right-0 left-0 bottom-0 h-screen items-center bg-gray-950 '>
        <Spinloader />
    </div>
  )
}

export default Loader