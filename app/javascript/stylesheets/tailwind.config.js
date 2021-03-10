const colors = require("tailwindcss/colors");
module.exports = {
  purge: [
    "./app/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/javascript/**/*.vue",
  ],
  darkMode: false, // or media or class
  theme: {
    fontFamily: {
      body: ["Montserrat", "sans-serif"],
    },
    extend: {
      colors: {
        primaryLight: "#3778c2",
        primaryDark: "#2D619D",
        secondary: "#5fb523",
        secondaryDark: "#4c8f1c",
        tertiary: {
          25: "#989DA3",
          50: "#878A8F",
          75: "#555E67",
          100: "#434b54",
        },
        orange: colors.orange,
      },
    },
    minHeight: {
      0: "0",
      1: "5vh",
      2: "10vh",
      "1/3": "20vh",
      "1/4": "25vh",
      "1/2": "50vh",
      "3/4": "75vh",
      "3/5": "80vh",
      "4/5": "90vh",
      5: "95vh",
      full: "100vh",
    },
    screens: {
      'sp': "320px",
      // => @media (min-width: 320px) { ... }

      'mp': "480px",
      // => @media (min-width: 480px) { ... }

      'sm': "640px",
      // => @media (min-width: 640px) { ... }

      'md': "768px",
      // => @media (min-width: 768px) { ... }

      'lg': "1024px",
      // => @media (min-width: 1024px) { ... }

      'xl': "1280px",
      // => @media (min-width: 1280px) { ... }

      '2xl': "1536px",
      // => @media (min-width: 1536px) { ... }
    },
  },
  variants: {
    extend: {
      appearance: ["hover", "focus"],
    },
  },
  plugins: [],
};
