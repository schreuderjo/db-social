$(document).ready(function(){
  $(".all-posts").on("click", ".comment-link", function(e){
    e.preventDefault();

    // debugger;
    var request = $.ajax({
      url: $(this).attr("href"),
      type: "get"
    });

    // $( ".inner" ).append( "<p>Test</p>" );

    request.done(function(response){
      console.log(response);
      $("*[data-post-container-id=" + response.postId +"]").append(response.html)
    });

    request.fail(function(response){
      console.log(response);


    });

    console.log('foo');
  });

  $(".all-posts").on("submit", "#new-comment", function(e){
    e.preventDefault();
    // console.log("suck it Nate");
    // debugger;

    var postId = $(this).attr('data_attr');
    var url = '/posts/' + postId + '/comments';
    debugger;
    var request = $.ajax({
      url: '/posts/' + postId + '/comments',
      type: 'post',
      data: $(this).serialize()
    });


  });
});
