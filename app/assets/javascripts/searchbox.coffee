$ = window.jQuery
if $('body.playlists').length
  $(document).ready ->
    $(document).on 'click', '.search_results', ->
      playlist_id = $('#searchbox').data('playlistId')
      $.ajax
        url: "/api/v1/playlists/#{playlist_id}/tracks"
        method: 'POST'
        data: { track: $(@).data() }
        success: ->
          window.refresh()

    $(document).on 'click', ->
      $('#search_results').remove()

    ajax_request = null

    nextItem = (cur) ->
      $('.search_results').removeClass('hover').eq(cur).addClass 'hover'
      if $('.search_results').eq(cur).position()?
        h = $('.search_results').eq(0).height()
        if ($('.search_results').eq(cur).position().top + h) > $('#search_results').height()
          document.querySelector('#search_results').scrollTop += h * 3
        if $('.search_results').eq(cur).position().top < 0
          document.querySelector('#search_results').scrollTop -= h * 3

    $('#searchbox').on 'keyup', (e) ->
      $this = $(@)
      length = $('.search_results').length
      cur = $('.search_results.hover').index()
      if e.keyCode is 40
        cur++
        cur = length if cur >= length
        nextItem cur
      else if e.keyCode is 38
        cur--
        cur = 0 if cur <= 0
        nextItem cur
      else if e.keyCode is 13
        $('.search_results.hover').trigger 'click'
      else
        if $this.val().length >= 3
          $this.addClass 'loading'
          if ajax_request?
            ajax_request.abort()
          ajax_request = $.ajax
            url : '/api/v1/search'
            method: 'GET'
            data :
              q: encodeURIComponent $(@).val()
            datatype: 'json'
            success: (json) ->
              html = ''
              for i in json
                if i.artist?
                  concat = "#{i.artist}<br />#{i.title}"
                else
                  concat = "#{i.title}"
                html += """
                <a class="search_results" href="#"
                  data-title="#{i.title}"
                  data-provider="#{i.provider}"
                  data-provider_track_id="#{i.provider_track_id}"
                  data-duration="#{i.duration}"
                  data-artist="#{i.artist}"
                  data-image_url="#{i.image_url}"
                  title="#{i.artist} - #{i.title}"
                >
                  <img src="#{i.image_url}" class="cover" />
                  <span>#{concat}</span>
                </a>
                """
              $("body").append '<div id="search_results" />'
              $('#search_results').css(
                top: $this.offset().top + $this.outerHeight()
                left: $this.offset().left
                width: $this.outerWidth()
                'max-width': $this.outerWidth()
              ).html html
              document.querySelector('#search_results').scrollTop = 0
              $this.removeClass 'loading'
