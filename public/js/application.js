$(window).load(function() {
  $(".loader").fadeOut("slow");
});


$(document).ready(function() {

$('.panel form').on("submit",function(event) {
  event.preventDefault();
  var $target = $(event.target);
  // $('form').prop('disabled', true);
  // $target.find("input[type=submit]").val("...");

  $.ajax({
    type: $target.attr("method"),
    url: $target.attr("action"),
    data: $('.panel form').serialize()
  }).done(function(response){
    $('*').html(response);
    $('html, body').animate({ scrollTop: 0 }, 0);
  });

});

$("#hello").hover(function(){
  $("#mikasa").html("<a href='/logout'>logout,</a>");
}, function(){
  $("#mikasa").html("bless you, ");
});

$("#section-5 form").on("submit", function(event){
  event.preventDefault();
  var $target = $(event.target);
  $.ajax({
    type: $target.attr("method"),
    url: $target.attr("action"),
    data: $('#section-5 form').serialize()
  }).done(function(response){
    $("#section-5").html(response);
 });
});
});


function checkURL(url) {
  return(url.match(/\.(jpeg|jpg|gif|png)$/) != null);
}
