$(document).on('turbolinks:load', function(){
  var carouselInterval = setInterval(function() {
    $('.carousel').carousel('next');
  }, 8000);
  $('.carousel.carousel-slider').carousel({full_width: true});
});
