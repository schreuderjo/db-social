$(document).ready(function(){
  $(".post-container").on("click", "#post-button", function(e) {
    e.preventDefault();
    console.log("foo");
  });
});

//selector is missing
