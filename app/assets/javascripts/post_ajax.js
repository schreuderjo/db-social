$(document).ready(function(){
  //New post request
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

  //edit post form drop down
  $(".all-posts").on("click", ".edit-post-form", function(e){
    e.preventDefault();

    var href = $(this).attr("href");
    var postId = href.match(/\d+/)[0];

    var request = $.ajax({
      url: '/posts/' + postId,
      type: 'get'
    });

    request.done(function(response){
      $("*[data-post-id=" + postId +"]").replaceWith(response.html);
    });

    request.fail(function(response){
      console.log(response);
    });
  });
  //   var href = $(this).attr("href");
  //   var postId = href.match(/\d+/)[0];
  //   var selectedText = $("*[data-post-id="+ postId +"]");
  //   selectedText.toggleClass("hidden");
  //   $("*[data_attr=" + postId +"]").toggleClass("hidden");

  $(".all-posts").submit(function(e){
    e.preventDefault();

    var postId = $(".edit-post").attr("data_attr")

    var request = $.ajax({
      url: "/posts/" + postId,
      type: 'put',
      data: $(".edit-post").serialize(),
      dataType: "json"
    });

    request.done(function(response){
      $(".edit-post").replaceWith(response.html);
    });

    request.fail(function(response){
      console.log(response);
    });
  });


  $(".all-posts").on("click", ".delete-post", function(e){
    e.preventDefault();
    console.log("bar");
  });
});

