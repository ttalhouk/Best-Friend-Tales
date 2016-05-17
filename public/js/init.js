$(document).ready(function() {
  // Side Navbar for Mobile
  $(".button-collapse").sideNav();
  // Character Counter for Form Fields
  $('input#input_text, textarea#textarea1').characterCounter();
  // Homepage parallax
  $('.parallax').parallax();


  $('.collapsible').collapsible({
      accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
    });

  $("#edit-post").on('click', function(event){
    event.preventDefault()
    var link = $(this).attr('href')
    $("#post-buttons").hide()
    $.ajax({
      method: "get",
      url: link
    }).done(function(messages){
      console.log(messages)
      $("#comments").append(messages)
    })

  })

});
