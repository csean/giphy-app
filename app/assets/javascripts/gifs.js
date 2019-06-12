// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  $('#search-form').on('submit', function(e) {
    e.preventDefault();
    $.ajax({
      url: '/gifs/search',
      data: { query: $('#query').val() },
      dataType: 'script'
    });
  });

  $('#gifs').on('click', '.search-navigation', function(e) {
    e.preventDefault();
    $.ajax({
      url: '/gifs/search',
      data: { query: $('#query').val(), page: $(this).data('page') }
    });
  });

  $('#gifs').on('click', '.favorite', function(e) {
    token = $('meta[name="csrf-token"]').attr('content');
    e.preventDefault();
    $.ajax({
      url: '/gifs/' + $(this).data('giphy-id') + '/favorite',
      method: 'put',
      beforeSend: function (xhr) {
        xhr.setRequestHeader('X-CSRF-Token', token)
      }
    });

    $(this).children('i').toggleClass('favorited');
  });

  // $('#trending').on('click', function(e){
  //   e.preventDefault();
  // });

  $('.select2').select2({
    theme: 'bootstrap',
    tags: true,
    createTag: function(params) {
      var term = $.trim(params.term);
      console.log(term);
      if (term === '') {
        return null;
      }

      return {
        id: term,
        text: term,
        newTag: true
      }
    }
  });
});
