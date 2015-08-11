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

  var marker = new google.maps.Marker({
                                      map: map,
                                      position: latlong,
                                      title: name
                                      });
}

function loadFullMap(){
var route = "/charities/map";
  var request = $.ajax({url: route, method: 'GET', dataType: "json"});
  request.done(function(response){
      generateFullMap(response);
      });
}

function generateFullMap(charities){
  var latlngCenter = new google.maps.LatLng(41.88387, -87.631808);
  var myOptions = {
                    zoom: 10,
                    center: latlngCenter,
                  }
  var map = new google.maps.Map(document.getElementById("full-map-canvas"), myOptions);
  for(var i=0; i<charities.length; i++){
    var latlong = { lat: charities[i]["latitude"], lng: charities[i]["longitude"] };
    var name = charities[i]["name"];
    var message = name;
    var marker = new google.maps.Marker({
                                      map: map,
                                      position: latlong,
                                      title: name
                                      });
    function addInfoWindow(marker, message) {
      var infoWindow = new google.maps.InfoWindow({
                content: message
            });
            google.maps.event.addListener(marker, 'click', function () {
                infoWindow.open(map, marker);
            });
        } 
    addInfoWindow(marker, message);
  }
}




