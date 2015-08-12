
$(document).ready(function() {

	console.log("hey");

	$(document).on("click",".wishlist-class",function(){


//   var id = $(this).data("id");
//   var href = $(this).data("href");
//   var count = $(this).data("count");
//   var element = "<a href='" +href+ "' data-remote=true><span class='ui blue small icon button scheduled-count schedule-button leads'>" +count+ "</span></a>";
//   $("#schedule_call_"+id).html(element);
	});

  $("#star").on('click', function(event){
    event.preventDefault();
    var star = $("#star").find("#star_icon")
    var route = $(this).attr("href");
    var request = $.ajax({url: route});
    request.done(function(response){
      star.toggleClass("empty");
    });
  });





});
