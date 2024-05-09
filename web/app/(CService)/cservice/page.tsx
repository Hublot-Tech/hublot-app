import React from 'react'
import Link from 'next/link'
import { redirect } from 'next/navigation'

function CService() {
  // redirect to automatic /Dashboard
  redirect('/cservice/dashboard')
}

export default CService