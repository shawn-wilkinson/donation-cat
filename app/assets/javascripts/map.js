function loadMap() {
  var address = document.getElementById("mailing-address").innerText;
  codeAddress(address);
}
function codeAddress(address) {
          var geocoder = new google.maps.Geocoder();
          geocoder.geocode({'address': address}, function(results, status) {
              if (status == google.maps.GeocoderStatus.OK) {
                  var myOptions = {
                      zoom: 14,
                      center: results[0].geometry.location,
                      mapTypeId: google.maps.MapTypeId.ROADMAP
                  }
                  var map = new google.maps.Map(document.getElementById("map-canvas"), myOptions);

                  var charityName = document.getElementById("charity-name").innerText;

                  var marker = new google.maps.Marker({
                      map: map,
                      position: results[0].geometry.location,
                      title: charityName
                  });
              }
          });
}

window.onload=loadMap;



