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
        tertiary: {
          25: "#989DA3",
          50: "#878A8F",
          75: "#555E67",
          100: "#434b54",
        },
        orange: colors.orange,
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
};
