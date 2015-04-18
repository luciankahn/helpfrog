$(document).ready(function() {
  $('#submit-comment').on('click', function(event) {
    event.preventDefault();
    var $form = $(event.target);
    $.ajax({
      url: $form.attr('action'),
      type: $form.attr('method'),
      data: $form.serialize()
    }).done(function (response) {
      var $newComment = $(response);
      $(#comments-container).prepend($newComment);
    }).fail(function (response) {

    })
  });
});
