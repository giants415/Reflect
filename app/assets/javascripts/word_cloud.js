// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

console.log("word cloud JS");

var d3 = require("d3.js"),
    cloud = require("d3.layout.cloud.js");
    console.log("word cloud JS 2");

var fill = d3.scale.category20();

var layout = cloud()
    .size([500, 500])
    .words([
      "Hello", "world", "normally", "you", "want", "more", "words",
      "than", "this"].map(function(d) {
      return {text: d, size: 10 + Math.random() * 90, test: "haha"};
    }))
    .padding(5)
    .rotate(function() { return ~~(Math.random() * 2) * 90; })
    .font("Impact")
    .fontSize(function(d) { return d.size; })
    .on("end", draw);

    console.log("word cloud JS 3");
layout.start();
console.log("word cloud JS 4 " + layout);

function draw(words) {
  console.log(words)
  var target  = d3.select("target");
  console.log (target)
  d3.select("#target").append("svg")
      .attr("width", layout.size()[0])
      .attr("height", layout.size()[1])
    .append("g")
      .attr("transform", "translate(" + layout.size()[0] / 2 + "," + layout.size()[1] / 2 + ")")
    .selectAll("text")
      .data(words)
    .enter().append("text")
      .style("font-size", function(d) { return d.size + "px"; })
      .style("font-family", "Impact")
      .style("fill", function(d, i) { return fill(i); })
      .attr("text-anchor", "middle")
      .attr("transform", function(d) { return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";})
      .text(function(d) { return d.text; });
}
