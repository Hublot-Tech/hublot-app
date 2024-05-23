"use client"
import React, { useEffect, useRef, useState } from 'react';
import anime from 'animejs/lib/anime.es.js';
import Link from 'next/link';
import { set } from 'animejs';


const ComingSoon = () => {
  const movingLettersRef = useRef(null);
  const chaine = "Bientôt...";
  const [isVisible, setIsVisible] = useState(false);

  useEffect(() => {
    // Animation des lettres avec anime.js
    anime.timeline({ loop: false })
      .add({
        targets: '.letter',
        scale: [0, 1],
        duration: 3600,
        elasticity: 600,
        delay: (el, i) => 45 * (i + 1)
      }).add({
        targets: '.ml9',
        opacity: 0,
        duration: 1000,
        easing: 'easeOutExpo',
        delay: 1000
      }).finished.then(() => setIsVisible(true));
    
    anime.timeline({ loop: false })
      .add({
        targets: ".get-started",
        translateY: [100, 0],
        opacity: [0, 1],
        delay: 6000,
        duration: 3000,
      })
  }
  , []);

  return (
    <section className="h-screen flex flex-col justify-center bg-black text-white">
      <div className="gap-2 m-4">
        <div className="moving-letters items-center text-center">
          <h1 className="ml9 text-5xl font-bold">
            <span className="text-wrapper">
              <span className="letters">
              {Array.from(chaine).map((char, index) => (
                  char === ' ' ? (
                      <span key={index}>&nbsp;</span> // Si le caractère est un espace, insérer un espace insécable
                  ) : (
                      <span id="letter" className="letter " key={index}>{char}</span>
                  )
              ))}
              </span>
            </span>
          </h1>
        </div>
        <div className="w-full text-center justify-center get-started">
         {isVisible &&  <button className="bg-yellow-600 hover:bg-yellow-600 text-white hover:shadow-lg font-normal py-2 px-4  mt-4">
            <Link href="/hublot-app">
             Démarrons
            </Link>
          </button>}
        </div>
      </div>

    </section>
  );
};

export default ComingSoon;
