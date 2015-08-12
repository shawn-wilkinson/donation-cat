
$(document).ready(function() {

	$(document).on("click",".wishlist-class",function(event){
		event.preventDefault();
	
		var that = $(this);
		var request = $.ajax({
    url: $(this).attr('ajax_path'), 
    method: 'GET'  

  });

		request.done(function(response){
			console.log("shazaam");
			console.log(response);
			that.hide();
			$("#ajaxify").prepend(response);
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
