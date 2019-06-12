// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  $('#tag').on('click', '.search-navigation', function(e) {
    tag = $('#tag').data('tag');
    e.preventDefault();
    $.ajax({
      url: '/tags/' + ,
      data: { query: $('#query').val(), page: $(this).data('page') }
    });
  });
})
