$ = window.jQuery

$(document).ready ->
  $(document).on 'click', '.search_results', ->
    playlist_id = $('#searchbox').data('playlistId')
    $.ajax
      url: "/api/v1/playlists/#{playlist_id}/tracks"
      method: 'POST'
      data: { track: $(@).data() }
      success: ->
        refresh()

  $(document).on 'click', ->
    $('#search_results').remove()

  ajax_request = null

  $('#searchbox').on 'keyup', ->
    $this = $(@)
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
          $this.removeClass 'loading'
