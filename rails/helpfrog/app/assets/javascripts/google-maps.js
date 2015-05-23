$(document).ready(function() {
  // ajax call if the current page is the results page
  if ($('#results-page').length) {
    $.ajax({
      url: document.location.href, // gets the url of the current page, including the query string
      type: 'GET',
      dataType: 'json'
    }).done(function(response) {
      var places = response;
      // create a new google map, centered on the first set of lat_longs
      var map;
      function initialize() {

        // CREATE MAP

        var latLng = new google.maps.LatLng(places[0][0], places[0][1]);
        var mapOptions = {
          zoom: 12,
          center: latLng
        };

        var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
      // for each array in the response, drop a marker using the latitude and longitude.
        var marker;
        for (var i=0; i<places.length; i++) {
          marker = new google.maps.Marker({
            position: new google.maps.LatLng(places[i][0], places[i][1]),
            map: map,
            title: places[i][2],
            place_id: places[i][3]
          })
          google.maps.event.addListener(marker, 'click', function() {
              var path = ((window.location.href).split('/result')[0]);
              window.location.assign(path + "/places/" + this.place_id);
            });
        }
      }
      initialize();
    }).fail(function(response) {
      console.log("Fail.")
    })
  }

});