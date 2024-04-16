import React from "react";
import HeroForm from "../molecules/HeroForm";
import Image from "next/image";

function Hero() {
  return (
    <section className="bg-white dark:bg-gray-900">
      <div className="grid max-w-screen-xl px-4 py-8 mx-auto lg:gap-8 xl:gap-0 lg:py-16 lg:grid-cols-12">
        <div className="text-center lg:text-start lg:col-span-7">
          <h1 className="max-w-2xl mb-4 text-4xl font-bold tracking-tight leading-none md:text-5xl xl:text-5xl dark:text-white">
            Les meilleurs prestataires de services à portée de main
          </h1>
          <p className="max-w-2xl mb-6 font-light text-black lg:mb-6 md:text-lg lg:text-xl dark:text-gray-400">
            Hubblot est une plateforme qui met en relation les prestataires de services et les clients. 
            Vous permettant de trouver rapidement et facilement un prestataire de service dans votre ville.
          </p>
          <p className="max-w-xl mb-2 font-normal text-orange-800 lg:mb-2 md:text-lg lg:text-xl dark:text-gray-400">
            L&apos;application sera bientot disponible, mais vous pouvez nous decrire les services que vous recherchez.
          </p>
          <HeroForm />  

        </div>
        <div className="hidden lg:mt-0 lg:col-span-5 lg:flex">
          <img
            src="/images/mockup.png"
            alt="mockup"
          />
        </div>
      </div>
    </section>
  );
}

export default Hero;
