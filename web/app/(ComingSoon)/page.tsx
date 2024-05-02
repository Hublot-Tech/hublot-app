"use client"
import React, { Suspense } from 'react'
import ComingSoon from './components/animate/ComingSoon'

function page() {
  return (
    <Suspense fallback={"Loading"}>
      <ComingSoon />
    </Suspense>
    )
}

export default page