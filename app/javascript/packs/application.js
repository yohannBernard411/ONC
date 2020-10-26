// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
import { displayMenu } from '../components/menu';
import { displayFlag } from '../components/langue';
import { displayDropDownMenu } from '../components/dropdownMenu';
import { displayStars } from '../components/starSystem';
import { displayViewer } from '../components/myViewer';
import { sumInGrid } from '../components/calculGrid';
import { adaptScreenSize } from '../components/imageSizing';
import { displayComments } from '../components/comments';
import { displaySizes } from '../components/sizes';
import { colorize } from '../components/colorizeGrid';
import { print } from '../components/etiquettes';
import { checkboxcgv } from '../components/cgv';
import { accordionMenu } from '../components/accordionMenu';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  displayMenu();
  displayFlag();
  displayDropDownMenu();
  displayStars();
  displayViewer();
  sumInGrid();
  adaptScreenSize();
  displaySizes();
  displayComments();
  colorize();
  print();
  checkboxcgv();
  accordionMenu();
});
