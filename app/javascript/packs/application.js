// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";



// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { renderCalendar } from '../components/calendar';
import { initTimer } from '../components/pomodoro';


// import { moodEdit } from '../components/edit_mood';


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  const workBtn = document.getElementById("work-btn")
  const calendar = document.getElementById("calendar")

  // initSelect2();

  if (workBtn){
    initTimer();
  }
  if (calendar){
    renderCalendar();
  }



});
