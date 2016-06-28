$(document).ready(function() {

  $(".up-btn").click(function() {

    var clicked = $(this)
    var commentId = clicked.data("comment-id")

    console.log("Votes updated")

    $.ajax("/comments/" + commentId + "/vote", {
      method: "POST",
    data: { value: 1 }
    error:   function() { alert("Mistakes were made") },

    success: function(data) {

      clicked.closest("tr).find(".orange").removeClass("orange")
      clicked.addClass("orange")
    }
    })
  })

    $.ajax("/comments/" + commentId + "/vote", {
      method: "POST",
    data: { value: 1 }
    error:   function() { alert("Mistakes were made") },

    success: function(data) {

      clicked.closest("tr).find(".orange").removeClass("orange")
      clicked.addClass("orange")
    }
    })

