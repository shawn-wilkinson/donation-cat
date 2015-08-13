  $("#category_follow").on('click', function(event){
    event.preventDefault();
    var follow = $("#category_follow").find("#follow")
    var route = $(this).attr("href");
    var request = $.ajax({url: route});
    request.done(function(response){
      follow.toggleClass("yellow");
      follow.toggleClass("grey")
      follow.transition('pulse');
      if(follow.text() === "Follow Category"){
        follow.text("Unfollow Category");
      } else {
        follow.text("Follow Category");
      };
    });
  });
