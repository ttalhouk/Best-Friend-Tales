$(document).ready(function() {
  // Side Navbar for Mobile
  $(".waiting").hide()
  $(".button-collapse").sideNav();
  // Character Counter for Form Fields
  $('input#input_text, textarea#textarea1').characterCounter();
  $('#textarea1').val('New Text');
  $('#textarea1').trigger('autoresize');
  // Homepage parallax
  $('.parallax').parallax();
  // New pet form
  $('select').material_select();
  $('select').material_select('destroy');
  Materialize.updateTextFields();
  // hide shelter contact info
  $("#contact-details").hide()


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
      $("#comments").append(messages)
    })

  })
  $("#add-comment").on('click', function(event){
    event.preventDefault()
    var link = $(this).attr('href')
    $("#post-buttons").hide()
    $.ajax({
      method: "get",
      url: link
    }).done(function(messages){
      $("#comments").append(messages)
    })

  })
  //   $("#add-comment").on('click', function(event){
  //   event.preventDefault()
  //   var link = $(this).attr('href')
  //   $("#post-buttons").hide()
  //   $.ajax({
  //     method: "get",
  //     url: link
  //   }).done(function(messages){
  //     $("#comments").append(messages)
  //   })

  // })

  $("#adopt-button").on('click', function(event){
    event.preventDefault()
    $(this).hide()
    $("#contact-details").show()
  })

  $(".add-more").on('click', function(event){
    event.preventDefault();
    var link = $(this).attr('href')
    $("#more-pets").hide();
    $(".waiting").show();
    $.ajax({
      method: "get",
      url: link
    }).done(function(messages){
      $(".waiting").hide()
      $("#pet-cards").append(messages)
      $("#more-pets").show()
    }).fail(function(errors){
      console.log(errors)
    })
  })

});
