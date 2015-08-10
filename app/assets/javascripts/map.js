function loadMap() {
  var route = window.location.pathname.concat('/map');
  var request = $.ajax({url: route, method: 'GET', dataType: "json"});
  request.done(function(response){
      var latlong = { lat: response["latitude"], lng: response["longitude"] };
      var name = response["name"];
      generateMap(latlong, name)
});
}

function generateMap(latlong, name) {
  var myOptions = {
                    zoom: 14,
                    center: latlong,

                  }
  var map = new google.maps.Map(document.getElementById("map-canvas"), myOptions);
  var charityName = name;

  var marker = new google.maps.Marker({
                                      map: map,
                                      position: latlong,
                                      title: charityName
                                      });
}






