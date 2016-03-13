$ = window.jQuery

if $('body.home').length

  $neon = $('.logo-shadow')

  lightening = ->
    setTimeout ->
      $neon.stop().css('opacity', 0).animate(
        opacity: 1
      , Math.floor(Math.random() * 1000))
      lightening()
    , Math.floor(Math.random() * 1000)

  lightening()
