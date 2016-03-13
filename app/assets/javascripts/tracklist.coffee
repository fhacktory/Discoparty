$ = window.jQuery

iframeTpls =
  deezer: 'https://www.deezer.com/plugins/player?format=classic&autoplay=true&playlist=false&width=700&height=350&color=007FEB&layout=dark&size=medium&type=tracks&id=%1&app_id=1'
  soundcloud: 'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/%1&auto_play=true&hide_related=false&show_comments=true&show_user=true&show_reposts=false&visual=true'

current = 0

$ww = $ '#widget_wrapper'

first = true

next = =>
  if !first
    playlist_id = $('#searchbox').data('playlistId')
    $.ajax
      url: "/api/v1/playlists/#{playlist_id}/tracks/" + $('.playlist-container .track-container').eq(0).data('id')
      method: 'PUT'
      data:
        track:
          played: true
    $('.playlist-container .track-container').eq(0).remove()
  else
    first = false
  if $('.playlist-container .track-container').length
    track = $('.playlist-container .track-container').eq(0).addClass('playing').data()
    $ww.html '<div id="widget_' + track.provider + '"></div>'
    if track.provider is 'youtube'
      player = new YT.Player 'widget_youtube',
        height: '390'
        width: '640'
        videoId: track.track
        events:
          'onReady': onPlayerReady
          'onStateChange': onPlayerStateChange
    else
      $ww.html '<iframe src="' + iframeTpls[track.provider].replace('%1', track.track) + '"></iframe>'
      setTimeout ->
        next()
      , track.duration
    current++

onPlayerReady = (event) ->
  event.target.playVideo()

onPlayerStateChange = (event) ->
  if event.data is YT.PlayerState.ENDED
    next()

$('.player-container .player').on 'click', ->
  $this = $(@)
  if $this.hasClass 'playing'
    $ww.html ''
    $this.removeClass 'playing'
  else
    next()
    $this.addClass 'playing'
