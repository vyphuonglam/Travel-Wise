// Slideshow rotation logic
let currentSlide = 0;
const slides = document.querySelectorAll('.activity-slide');
const captions = ["San Francisco", "San Jose", "Oakland", "San Francisco", "San Jose"];
const titles = [
  "Tech Time Musuem",
  "Turbo Track",
  "Color Combat",
  "Smash Pit",
  "Axe On"
];
const descriptions = [
  "Step into the future and explore cutting-edge innovations at the Tech Museum in the heart of Silicon Valley.",
  "Fuel your need for speed with an adrenaline-pumping go karting session that’s perfect for thrill-seekers of all ages",
  "Gear up, strategize, and dive into the action-packed world of paintball—where friendly fire is part of the fun!",
  "Release stress in the most satisfying way possible—smash, shatter, and let it all out in a high-energy rage room",
  "Channel your inner warrior and test your aim with the rustic thrill of axe throwing—it’s more fun than you’d expect!."
];

function showSlide(index) {
  slides.forEach((slide, i) => {
    slide.classList.remove('active');
    if (i === index) {
      slide.classList.add('active');
    }
  });
  document.getElementById('activity-caption').textContent = captions[index];
  document.getElementById('activity-title').textContent = titles[index];
  document.getElementById('activity-desc').textContent = descriptions[index];
}

setInterval(() => {
  currentSlide = (currentSlide + 1) % slides.length;
  showSlide(currentSlide);
}, 3000); // every 3 seconds

// Initial load
showSlide(currentSlide);
