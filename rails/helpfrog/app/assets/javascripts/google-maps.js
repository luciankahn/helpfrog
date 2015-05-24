$(document).ready(function() {

  // ajax call if the current page is the results page
  if ($('#results-page').length) {
    $.ajaxSetup({ cache: false });
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
        var image = 'assets/dot.svg';
        var pinColor = "00C69D";
        var pinImage = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinColor,
        new google.maps.Size(21, 34),
        new google.maps.Point(0,0),
        new google.maps.Point(10, 34));
        var pinShadow = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
        new google.maps.Size(40, 37),
        new google.maps.Point(0, 0),
        new google.maps.Point(12, 35));

        for (var i=0; i<places.length; i++) {
          marker = new google.maps.Marker({
            position: new google.maps.LatLng(places[i][0], places[i][1]),
            map: map,
            title: (i + 1) + ": " + places[i][2],
            place_id: places[i][3],
            iteration: i,
            icon: pinImage,
            shadow: pinShadow
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