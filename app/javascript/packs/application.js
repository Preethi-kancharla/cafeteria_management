// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require("jquery");

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).ready(function () {
    $(document).on("click", ".cafeteria-navbarHeading > .container", function () {
      $(this).toggleClass("change");
      $(".cafeteria-navbarAllButtons").toggle(300);
    });
  
    $(document).on("click", ".menuButton", function () {
      $(".cafeteria-menu").toggle(300);
    });
  
    $(document).on("change", "#menu-name", function () {
      if ($(this).val() == "Others") {
        $("#new_menu_name").show(300, function () {
          $(".new-menu-name-edit").css({ display: "block" });
        });
      } else {
        $("#new_menu_name").hide(300);
      }
    });
  
    $(document).on("click", "#menuName", function () {
      id = $(this).attr("class");
      position = $("#" + id).position();
      $("html").animate({ scrollTop: position.top }, 500);
      if ($(window).innerWidth() < 800) {
        $(".cafeteria-menu").hide(300);
      }
    });
  });
  
