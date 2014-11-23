$(document).ready(function(){
  //nice upvote
  $(".add-to-favorites-link").click(function(e){
    e.preventDefault();

    var url = $(this).attr("href");
    var postId = url.match(/\d+/)[0];

    var request = $.ajax({
      url: url,
      type: "post"
    });

    request.done(function(response){
      console.log(response.html);
      $(".resources-list li").append(response.html);
    });

    request.fail(function(response){
      console.log(response);
    });
  });
});