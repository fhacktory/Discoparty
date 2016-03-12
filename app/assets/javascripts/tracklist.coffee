list = [
  {
    artist: 'OK GO'
    title: 'Needing/Getting'
    provider: 'youtube'
    provider_id: 'MejbOFk7H6c',
    duration: 30000
  }
  {
    artist: 'Daft punk'
    title: 'Around the world'
    provider: 'deezer'
    provider_id: '3138820'
    duration: 10000
  }
  {
    artist: 'Giorgio Moroder'
    title: '74 Is The New 24'
    provider: 'soundcloud'
    provider_id: '177337182'
    duration: 20000
  }
]

iframe_tpls =
  youtube: 'https://www.youtube.com/embed/%1?rel=0&controls=0&showinfo=0&autoplay=1'
  deezer: 'https://www.deezer.com/plugins/player?format=classic&autoplay=true&playlist=false&width=700&height=350&color=007FEB&layout=dark&size=medium&type=tracks&id=%1&app_id=1'
  soundcloud: 'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/%1&auto_play=true&hide_related=false&show_comments=true&show_user=true&show_reposts=false&visual=true'

current = 0

$ww = document.querySelector '#widget_wrapper'
$wl = document.querySelector '#widget_legend'

play = =>
  if list[current]?
    track = list[current]
    $wl.innerHTML = track.artist + ' - ' + track.title
    $ww.innerHTML = '<iframe src="' + iframe_tpls[track.provider].replace('%1', track.provider_id) + '"></iframe>'
    current++
    setTimeout ->
      play()
    , track.duration

play()
