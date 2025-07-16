// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "../stylesheets/home.css";  // ← css-bundling-rails の流儀

import jquery from "jquery"
window.$ = jquery

$(function(){
    alert('ok');
});