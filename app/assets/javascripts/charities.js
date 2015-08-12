$(document).ready(function() {
    


	$(document).on("click",".wishlist-class",function(event){
		event.preventDefault();
	

	// var hardCodedUrl = "http://localhost:3000/charities/pete's-cats-8/wishlists/new";

		var that = $(this);
		var request = $.ajax({
    url: $(this).attr('ajax_path'), 
    // url: hardCodedUrl,
    method: 'GET'
    
  });

		request.done(function(response){
			console.log("shazaam");
			console.log(response);
			that.hide();
			$("#ajaxify").prepend(response);
		});



	// 	var route = window.location.pathname.concat('/map');
	//   var request = $.ajax({url: route, method: 'GET', dataType: "json"});
	//   request.done(function(response){
	//       var latlong = { lat: response["latitude"], lng: response["longitude"] };
	//       var name = response["name"];
	//       generateMap(latlong, name)
	// });

	// wishlists/new
	// <%= link_to 'Edit', '#', :id => "edit_comment_link", :ajax_path => edit_post_comment_path(@post, @comment) %>

//   var id = $(this).data("id");
//   var href = $(this).data("href");
//   var count = $(this).data("count");
//   var element = "<a href='" +href+ "' data-remote=true><span class='ui blue small icon button scheduled-count schedule-button leads'>" +count+ "</span></a>";
//   $("#schedule_call_"+id).html(element);
	});





});