"use client"
import React, { Suspense, useEffect, useRef, useState } from 'react';
import anime from 'animejs/lib/anime.es.js';


const Countdown = () => {
  const [countdown, setCountdown] = useState('');

  useEffect(() => {
    // Set the date we're counting down to
    const countDownDate = new Date("Apr 15, 2024 14:00:00").getTime();

    const intervalId = setInterval(function() {
      // Get today's date and time
      const now = new Date().getTime();
        
      // Find the distance between now and the count down date
      const distance = countDownDate - now;
        
      // Time calculations for days, hours, minutes and seconds
      const days = Math.floor(distance / (1000 * 60 * 60 * 24));
      const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      const seconds = Math.floor((distance % (1000 * 60)) / 1000);
        
      // Output the result
      setCountdown(`${days}Jours : ${hours}Heures : ${minutes}Minutes : ${seconds}s`);

      // If the count down is over, clear interval
      if (distance < 0) {
        clearInterval(intervalId);
        setCountdown('Hubbot est disponible !');
      }
    }, 1000);

    return () => clearInterval(intervalId);
  }, []);

  return (
    <Suspense fallback={<div>Loading...</div>}>
      <p className="mt-5 text-center text-amber-800 font-extralight text-4xl">{countdown}</p>
    </Suspense>
  );
};

export default Countdown;
