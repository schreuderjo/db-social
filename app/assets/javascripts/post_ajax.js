$(document).ready(function(){
  $(".all-posts").on("click", "#new-post-button", function(e) {
    e.preventDefault();
    $(".post-form").toggleClass("hidden");
  });

  $("#new-post").submit(function(e) {
    e.preventDefault();

    var request = $.ajax({
      url: '/posts',
      type: 'post',
      data: $(this).serialize(),
      dataType: "json"
    });

    request.done(function(response){
      $(".all-posts").prepend(response.html);
      $(".post-form").toggleClass("hidden");
    });

    request.fail(function(response){
      console.log(response);
      $(".post-form").toggleClass("hidden");
    });
  });

  $(".all-posts").on("click", ".delete-post", function(e){
    e.preventDefault();
    console.log("foo");
  });
});

