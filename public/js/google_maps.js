var map;
function initialize() {

  // CREATE MAP

  var latLng = new google.maps.LatLng(-34.397, 150.644);
  var mapOptions = {
    zoom: 12,
    center: latLng
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

  // ADD A MARKER

  var marker = new google.maps.Marker({
    position: latLng,
    map: map,
    title: "Name of Resource"
  })
}





// Call initialize upon load of window.

google.maps.event.addDomListener(window, 'load', initialize);
