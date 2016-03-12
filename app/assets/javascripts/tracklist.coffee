list = [
  {
    artist: 'OK GO'
    title: 'Needing/Getting'
    provider: 'youtube'
    track_id: 'MejbOFk7H6c'
  }
  {
    artist: 'Daft punk'
    title: 'Around the world'
    provider: 'deezer'
    track_id: '3138820'
    duration: 30000
  }
  {
    artist: 'Giorgio Moroder'
    title: '74 Is The New 24'
    provider: 'soundcloud'
    track_id: '177337182'
    duration: 20000
  }
  {
    artist: 'OK GO'
    title: 'Needing/Getting'
    provider: 'youtube'
    track_id: 'MejbOFk7H6c'
  }
]

iframeTpls =
  deezer: 'https://www.deezer.com/plugins/player?format=classic&autoplay=true&playlist=false&width=700&height=350&color=007FEB&layout=dark&size=medium&type=tracks&id=%1&app_id=1'
  soundcloud: 'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/%1&auto_play=true&hide_related=false&show_comments=true&show_user=true&show_reposts=false&visual=true'

current = 0

$ww = document.querySelector '#widget_wrapper'
$wl = document.querySelector '#widget_legend'

next = =>
  clearInterval startTimer
  if list[current]?
    track = list[current]
    $wl.innerHTML = track.artist + ' - ' + track.title
    $ww.innerHTML = '<div id="widget_' + track.provider + '"></div>'
    if track.provider is 'youtube'
      player = new YT.Player 'widget_youtube',
        height: '390'
        width: '640'
        videoId: track.track_id
        events:
          'onReady': onPlayerReady
          'onStateChange': onPlayerStateChange
    else
      $ww.innerHTML = '<iframe src="' + iframeTpls[track.provider].replace('%1', track.track_id) + '"></iframe>'
      setTimeout ->
        next()
      , track.duration
    current++

onPlayerReady = (event) ->
  event.target.playVideo()

onPlayerStateChange = (event) ->
  if event.data is YT.PlayerState.ENDED
    next()

startTimer = setInterval ->
  if ytCanPlay
    next()
, 500
