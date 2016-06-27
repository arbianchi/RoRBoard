

$(document).ready(function() {
  now = new Date();
  var date = now.toLocaleDateString();
  var time = now.toLocaleTimeString();
  var counter = 0
  var count = $("#count")

  var incrementCounter = (function() {
    console.log("btn")
    counter += 1
    if (counter > 9) {
      $("#count").addClass("red")
    }
  count.text(counter)
  });


var decrementCounter = (function() {
  console.log("btn")
  if (counter > 1) {
    counter -= 1 }
  else {
    counter = 0
  }

count.text(counter)
});

var resetCounter = (function(){
  counter = 0
  count.text(counter)
  var entry = $("<li>")
  entry.append( $("<span>").text("Reset logged on " + date + " at " + time))
  $(".log").append( entry )
});



$("#up").click( incrementCounter )
$("#down").click( decrementCounter )
$("#reset").click( resetCounter )

})
