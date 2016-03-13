$ = window.jQuery
if $('body.playlists').length
  $(document).ready ->
    playlist_id = $('#searchbox').data 'playlistId'

    $(document).on 'click', '.like-vote-container, .dislike-vote-container', ->
      $this = $(@)
      $this.removeClass('pulse animated')
      meth = if $this.hasClass('voted') then 'DELETE' else 'POST'
      $.ajax
        url: $this.data('url')
        method: meth
        success: ->
          $this.addClass('pulse animated')
          $this.toggleClass('voted')
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
