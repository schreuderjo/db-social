$(document).ready(function(){
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
