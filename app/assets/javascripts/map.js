var map;

function centerOnZip(zipCode) {
    geocoder = new google.maps.Geocoder();
    geocoder.geocode( { 'address': zipCode}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        map.setCenter(results[0].geometry.location);
      } else {
        alert("Geocode was not successful for the following reason: " + status);
      }
    });
  }

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
  map = new google.maps.Map(document.getElementById("map-canvas"), myOptions);

  var marker = new google.maps.Marker({
                                      map: map,
                                      position: latlong,
                                      title: name
                                      });
  // google.maps.event.addDomListener(window, 'load', initialize);
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
  map = new google.maps.Map(document.getElementById("full-map-canvas"), myOptions);
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

$(document).ready(function(){
  if($("body.map_locations.charities").length > 0){
    $("#search-zip-form").on('submit', function(event){
      event.preventDefault();
      $("#error-container").html("");
      var zip = $('input[name="search-zip"]').val()
      if(zip.length === 5){
        centerOnZip(zip);  
      } else {
        var error = "Please enter a valid 5-digit zip code.";
        $("#error-container").html(error);
      }
    });
  };
})


  



