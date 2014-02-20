// set up an ad closer click handler
// that slides up the add on click
$(".ad-wrapper").on("click", ".closer", function(e){
  e.preventDefault();
  $(this).parents(".ad-wrapper").slideUp();
});