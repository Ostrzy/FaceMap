function initialize() {
  var options = {
    zoom: 10,
    mapTypeId: google.maps.MapTypeId.HYBRID
  };
  var map = new google.maps.Map(document.getElementById('map_canvas'), options);
  addMarkerFromAddress(map, document.getElementById('location').innerHTML);
}

function addMarkerFromAddress(map, address) {
  var geocoder = new google.maps.Geocoder();
  geocoder.geocode( { 'address': address }, function(results, status) {
    if(status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
        map: map,
        position: results[0].geometry.location
      });
    } else {
      alert("Nie udało się znaleźć lokalizacji z następujących powodów: " + status);
    }
  });
}

window.onload = initialize;
