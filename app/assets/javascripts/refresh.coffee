$ = window.jQuery
if $('body.playlists').length
  $(document).ready ->
    playlist_id = $('#searchbox').data 'playlistId'

    $(document).on 'click', '.like-vote-container, .dislike-vote-container', ->
      $this = $(@)
      meth = if $this.data('action') is 'undefined' then 'PUT' else 'DELETE'
      $.ajax
        url: $this.data('url')
        method: meth
        success: ->
          if meth is 'PUT'
            $this.addClass 'voted'
          else
            $this.removeClass 'voted'
      false

    window.refresh = ->
      $.ajax
        url: "/api/v1/playlists/#{playlist_id}"
        method: "GET"
        success: (json) ->
          html = JST['templates/playlist']({ tracks: json.tracks })
          $('.playlist-container').html(html)

    window.refresh()

    setInterval ->
      window.refresh()
    , 3000
