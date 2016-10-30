$(document).ready(function(){
  var carouselInterval = setInterval(function() {
    $('.carousel').carousel('next');
  }, 10000);
  $('.carousel.carousel-slider').carousel({full_width: true});
});
