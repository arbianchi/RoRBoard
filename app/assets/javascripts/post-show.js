$(document).ready(function() {

  $(".up-btn").click(function() {

    var button = $(this)
    var commentId = button.data("comment-id")

    console.log("Votes updated")
    console.log(commentId)

    $.ajax("/comments/" + commentId + "/vote.json", {
      method: "POST",
    data: { value: 1 },
    error: function() { console.log("Mistakes were made") },

    success: function() {
      console.log("success!")
    }
    })
  })


  $(".down-btn").click(function() {

    var button = $(this)
    var commentId = button.data("comment-id")

    console.log("Votes updated")
    console.log(commentId)

    $.ajax("/comments/" + commentId + "/vote.json", {
      method: "POST",
    data: { value: -1 },
    error:   function() { console.log("Mistakes were made") },

    success: function() {
      console.log("success!")
    }
    })
  })

  var updateScore = function(){
    
    $(".total-votes").each(function() {

    var total = $(this)
    var commentId = total.data("comment-id")

    $.ajax("/comments/" + commentId + "/score.json", {
      method: "GET",
    error:   function() { console.log("Mistakes were made") },

    success: function(data) {
    console.log("success!",data)

    total.text( data.message)

    }

    })
  })
  } 
  setInterval(updateScore,1000)
})


