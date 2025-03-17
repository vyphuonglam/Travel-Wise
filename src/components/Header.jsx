import React from "react";
import travelwiselogo from "../assets/travelwiselogo.png";
import "./Header.css";
const Header = () => {
  return (
    <header className="header">
      <div className="header-left">
        <img src={travelwiselogo} alt="Logo" className="logo" />
        <span className="site-name">Travel Wise</span>
      </div>
      <nav className="header-right">
        <a href="#faqs">FAQs</a>
        <a href="#support">Support</a>
      </nav>
    </header>
  );
};

export default Header;
