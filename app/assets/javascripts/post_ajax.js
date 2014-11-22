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

  //edit post request
  $(".all-posts").on("click", ".edit-post", function(e){
    e.preventDefault();
    console.log("foo");
    $(".post-text").toggleClass("hidden");
    // debugger
    $(".post-text").replaceWith(<%= render partial: 'posts/edit_post', layout: false, locals: {post: Post.new} %>);


    // var res = $(this).attr("href").match(/\d+/);
    // debugger;

    // var request = $.ajax({
    //   url: '/posts/:id',
    //   type: 'get',
    //   data: $(this).attr("href"),
    //   dataType: "json"
    // });

    // request.done(function(response){
    //   console.log(response);
    // });

    // request.fail(function(response){
    //   console.log(response);
    // });
  });


  $(".all-posts").on("click", ".delete-post", function(e){
    e.preventDefault();
    console.log("bar");
  });
});

