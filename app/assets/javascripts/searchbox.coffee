if $('body.playlists').length
  $(document).ready ->
    $(document).on 'click', '.search-result', ->
      playlist_id = $('#searchbox').data('playlistId')
      $.ajax
        url: "/api/v1/playlists/#{playlist_id}/tracks"
        method: 'POST'
        data: { track: $(@).data() }
        success: ->
          $('.search-results-container').html('');

    $(document).on 'click', ->
      $('.search-results-container').html('');

    $(document).on 'mouseenter', '.search-result', ->
      $('.search-result').removeClass('hover')
      $(this).addClass('hover')

    ajax_request = null

    nextItem = (cur) ->
      $('.search-result').removeClass('hover').eq(cur).addClass('hover')
      if $('.search-result').eq(cur).position()?
        h = $('.search-result').eq(0).height()
        if ($('.search-result').eq(cur).position().top + h) > $('.search-results-container').height()
          document.querySelector('.search-results-container').scrollTop += h * 3
        if $('.search-result').eq(cur).position().top < 0
          document.querySelector('.search-results-container').scrollTop -= h * 3

    $('#searchbox').on 'keyup', (e) ->
      $this = $(@)
      length = $('.search-result').length
      cur = $('.search-result.hover').index()
      if e.keyCode is 40
        cur++
        cur = length if cur >= length
        nextItem cur
      else if e.keyCode is 38
        cur--
        cur = 0 if cur <= 0
        nextItem cur
      else if e.keyCode is 13
        $('.search-result.hover').trigger 'click'
      else
        if $this.val().length >= 3
          $this.addClass 'loading'
          if ajax_request?
            ajax_request.abort()
          ajax_request = $.ajax
            url : '/api/v1/search'
            method: 'GET'
            data:
              q: encodeURIComponent $(@).val()
            datatype: 'json'
            success: (json) ->
              html = JST['templates/search-results']({ tracks: json });
              $('.search-results-container').html(html);
              $this.removeClass 'loading'
