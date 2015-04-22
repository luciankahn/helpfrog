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

  $('#search-form').on('submit', function(event) {
    event.preventDefault();
    var $form = $(event.target);
    $.ajax({
      url: $form.attr('action'),
      type: $form.attr('method')
    }).done(function(response) {
      @lat_longs.each do |lat_long|
        console.log(lat_long[0]);
        console.log(lat_long[1]);
      end
    }).fail(function(response) {
      console.log("Fail.")
    })
  });

});
