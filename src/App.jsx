import React from 'react';
// import reactLogo from './assets/react.svg'
// import viteLogo from '/vite.svg'
import './App.css'
import Home from "./pages/Home"; // Import Home component
import Header from './components/Header';
import Footer from './components/Footer';

function App() {
  return (
    <div>
      <Header />
      <Home />  {/* Only renders the Home component */}
      <Footer />
    </div>
  );
}

export default App
