// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

var word_array = [
    {text: "Lorem", weight: 15},
    {text: "Ipsum", weight: 9},
    {text: "Dolor", weight: 6},
    {text: "Sit", weight: 7},
    {text: "Amet", weight: 5}
    // ...as many words as you want
];

  $(function() {


    // When DOM is ready, select the container element and call the jQCloud method, passing the array of words as the first argument.
    console.log("jqcloud call to build");
    $("div").jQCloud(word_array, {width: 500, height: 500});
  });
