import React from "react";
import Navbar from "../components/layouts/navbar";
import Hero from "../components/layouts/hero";
import Countdown from "../components/animate/CountDown";

function Hublot() {
  return (
    <>
      <Navbar />
      <main className="items-center justify-center w-full px-5 lg:px-12 text-center">
        <h1 className="text-6xl font-bold">Hublot</h1>
          <p className="mt-3 font-light text-2xl">Au coeur de vos services dans...</p>
          <Countdown />
          <Hero />
          
          <div className="lorem">
          </div>
      </main>
    </>
  );
}

export default Hublot;
