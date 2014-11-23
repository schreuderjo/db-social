$(document).ready(function(){

  //New post request
  $(".new-post-form-container").on("click", "#new-post-button", function(e) {
    e.preventDefault();
    $(".post-form").toggleClass("hidden");
    $("#new-post-button").toggleClass("hidden");
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
      $("#new-post-button").toggleClass("hidden");
    });

    request.fail(function(response){
      console.log(response);
      $(".post-form").toggleClass("hidden");
      $("#new-post-button").toggleClass("hidden");
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
      console.log(response.html);
      $("*[data-post-id=" + postId +"]").replaceWith(response.html);
    });

    request.fail(function(response){
      console.log(response.html);
    });
  });

  //update edited post to post container
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

  //delete post
  $(".all-posts").on("click", ".delete-post", function(e){
    e.preventDefault();

    var postId = $(this).attr("data_attr");

    var request = $.ajax({
      url: '/posts/' + postId,
      type: 'delete'
    });

    request.done(function(response){
      $("*[data-post-container-id=" + response.postId +"]").remove();
    });

    request.fail(function(response){
      console.log(response);
    });
  });

  //nice upvote
  $(".all-posts").on("click", ".nice-link", function(e){
    e.preventDefault();

    var url = $(this).attr("href");
    var postId = url.match(/\d+/)[0];

    var request = $.ajax({
      url: url,
      type: "post"
    });

    request.done(function(response){
      console.log(response.html);
      $("*[data-nice-container-id=" + postId +"]").replaceWith(response.html);
    });

    request.fail(function(response){
      console.log(response);
    });
  });
});

