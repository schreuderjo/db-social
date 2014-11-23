$(document).ready(function(){
  $(".add-to-favorites-link").click(function(e){
    e.preventDefault();

    var url = $(this).attr("href");

    var request = $.ajax({
      url: url,
      type: "post",
      data: {resource_id: $(this).attr("data_attr")}
    });

    request.done(function(response){
      console.log(response);
    $(".resources-list ul").append(response.html);
    });

    request.fail(function(response){
      console.log(response);
    });
  });
});
