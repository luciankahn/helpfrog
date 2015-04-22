$(document).ready(function() {
  $('#new-comment-form').on('submit', function(event) {
    event.preventDefault();
    var $form = $(event.target);
    $.ajax({
      url: $form.attr('action'),
      type: $form.attr('method'),
      data: $form.serialize()
    }).done(function(response) {
      var $newComment = $(response);
      $('#comments-container').prepend($newComment);
    }).fail(function(response) {
      console.log("Fail.")
    })
  });

  // ajax call if the current page is the results page
  if ($('#results-page').length) {
    $.ajax({
      url: document.location.href, // gets the url of the current page, including the query string
      type: 'GET',
      dataType: 'json'
    }).done(function(response) {
      // create a new google map, centered on the first set of lat_longs

      // for each array in the response, drop a marker using the latitude and longitude.
      var places = response;
      console.log(map); // out of scope
      for (var i=0; i<places.length; i++) {
        console.log(places[i][0] + "," + places[i][1]);
        new google.maps.Marker({
          position: new google.maps.LatLng(places[i][0], places[i][1]),
          map: map,
          title: "Fix This Later"
        })
      }
    }).fail(function(response) {
      console.log("Fail.")
    })
  }

});
