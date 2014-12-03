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
});


function checkURL(url) {
  return(url.match(/\.(jpeg|jpg|gif|png)$/) != null);
}
