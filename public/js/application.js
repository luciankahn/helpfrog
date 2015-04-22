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
      url: '/results',
      type: 'GET'
    }).done(function(response) {
      console.log(response);
    }).fail(function(response) {
      console.log("Fail.")
    })
  }

});
