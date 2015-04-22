var map;
function initialize() {

  // CREATE MAP

  var latLng = new google.maps.LatLng(-34.497, 150.644);
  var mapOptions = {
    zoom: 13,
    center: latLng
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

  // ADD A MARKER

  var marker1 = new google.maps.Marker({
    position: new google.maps.LatLng(-34.495, 150.644),
    map: map,
    title: "Name of Resource"
  })

  var marker2 = new google.maps.Marker({
    position: new google.maps.LatLng(-34.497, 150.644),
    map: map,
    title: "Name of Other Resource"
  })

}

// Call initialize upon load of window.

google.maps.event.addDomListener(window, 'load', initialize);
