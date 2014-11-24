$(document).ready(function(){
  //retrieve comment form
  // $(".all-posts").on("click", ".comment-link", function(e){
  //   e.preventDefault();

  //   var request = $.ajax({
  //     url: $(this).attr("href"),
  //     type: "get"
  //   });

  //   request.done(function(response){
  //     $("*[data-post-container-id=" + response.postId +"]").append(response.html);
  //   });

  //   request.fail(function(response){
  //     console.log(response);
  //   });
  // });

  //new comment submission
  $(".all-posts").on("submit", "#new-comment", function(e){
    e.preventDefault();

    var postId = $(this).attr('data_attr');
    var url = '/posts/' + postId + '/comments';
    // debugger;
    var request = $.ajax({
      url: '/posts/' + postId + '/comments',
      type: 'post',
      data: $(this).serialize()
    });

    request.done(function(response){
      $("*[data-comment-container-id=" + postId +"]").append(response.html);
      // $("#new-comment").remove();
      console.log(response);
    });

    request.fail(function(response){
      console.log(response);
    });

  });
});
