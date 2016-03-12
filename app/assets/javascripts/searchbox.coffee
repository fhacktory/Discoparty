$ = window.jQuery

$(document).ready ->
  $(document).on 'click', '.search_results', ->
    playlist_id = $('#searchbox').data('playlistId')
    $.ajax
      url: "/playlists/#{playlist_id}/tracks"
      method: 'POST'
      data: $(@).data()

  $('#searchbox').on 'keyup', ->
    if $(@).val().length >= 3
      $.ajax
        url : '/api/v1/search'
        method: 'GET'
        data :
          q: encodeURIComponent $(@).val()
        datatype: 'json'
        success: (json) ->
          html = ''
          for i in json
            html += """
            <a class="search_results" href="#"
              data-title="#{i.title}"
              data-provider="#{i.provider}"
              data-provider_track_id="#{i.provider_track_id}"
              data-duration="#{i.duration}"
              data-artist="#{i.artist}"
              data-picture_url="#{i.picture_url}"
            >
              #{i.artist} - #{i.title}
            </a>
            """
          $("body").append '<div id="search_results" />'
          $('#search_results').html html
