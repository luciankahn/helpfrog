var map;
function initialize() {
  console.log("I am in initialize.")
  var mapOptions = {
    zoom: 8,
    center: new google.maps.LatLng(-34.397, 150.644)
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
  console.log(map);
}

google.maps.event.addDomListener(window, 'load', initialize);

