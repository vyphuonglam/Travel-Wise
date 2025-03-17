import React, { useState } from "react";
import { Swiper, SwiperSlide } from "swiper/react";
import { Autoplay, EffectFade } from "swiper/modules";
import "swiper/css";
import "swiper/css/effect-fade";
import "./Landing.css"; // Import CSS
const slides = [
    "/images/badlandsnp.JPG",
    "/images/brycecanyon.JPG",
    "/images/waipiolookout.JPG",
    "/images/badlandsnp.JPG",
    "/images/brycecanyon.JPG",
    "/images/waipiolookout.JPG"
  ];
  

const Landing = () => {
  const [destination, setDestination] = useState("");
  const [departureDate, setDepartureDate] = useState("");

  return (
    <section className="landing">
      {/* Background Slider */}
      <Swiper
        modules={[Autoplay, EffectFade]}
        effect="fade"
        autoplay={{ delay: 3000, disableOnInteraction: false }}
        loop={true}
        slidesPerView={1}
        slidesPerGroup={1}
        className="landing-swiper"
      >
        {slides.map((image, index) => (
          <SwiperSlide key={index}>
            <img src={image} alt={`Slide ${index + 1}`} className="slide-image" />
          </SwiperSlide>
        ))}
      </Swiper>


      {/* Search Bars */}
      <div className="search-container">
        <div className="search-box">
          <label>Destination:</label>
          <input
            type="text"
            placeholder="Enter your destination..."
            value={destination}
            onChange={(e) => setDestination(e.target.value)}
          />
          <span className="search-icon">🔍</span>
        </div>

        <div className="search-box">
          <label>Departure Date:</label>
          <input
            type="date"
            value={departureDate}
            onChange={(e) => setDepartureDate(e.target.value)}
          />
          <span className="search-icon">📅</span>
        </div>
      </div>
    </section>
    
  );
};

export default Landing;
