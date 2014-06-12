// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require marquee
//= require jquery.slides
//= require jsclock-0.8
//= require_tree .

$(document).on('ready', function() {

  $('.flash-box .close').on('click', function() {
    $('.flash-box').hide();
    $('.brand').removeClass('focus');
  });

  $('.date-timer').jsclock();

  $('.home-slider').slidesjs({
    play: {
      auto: true,
      interval: 4000
    },
    pagination: {
      active: false
    },
    navigation: {
      active: false
    }
  });

  $('.marquee').marquee({
    duplicated: true,
    pauseOnHover: true,
    duration: 10000
  });
});
