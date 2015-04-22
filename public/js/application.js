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

  // not yet functional
  $('.edit-comment').on('click', function(event) {
    event.preventDefault();
    $.ajax({
      url: 'comments/:comment_id', // can I pass this id in through the form in a hidden field?
      type: "PUT"
    }).done(function(response){
      var $editedComment = $(response);
      // how do I use JS to replace the old comment with the new comment?
    }).fail(function(response){
      console.log("Fail.")
    })
  })

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

        var map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);
      // for each array in the response, drop a marker using the latitude and longitude.
        for (var i=0; i<places.length; i++) {
          console.log(places[i][0] + "," + places[i][1]);
          new google.maps.Marker({
            position: new google.maps.LatLng(places[i][0], places[i][1]),
            map: map,
            title: places[i][2]
          })
        }
      }
      initialize();
    }).fail(function(response) {
      console.log("Fail.")
    })
  }

});
