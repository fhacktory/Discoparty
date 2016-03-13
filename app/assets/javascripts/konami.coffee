$ = window.jQuery

$(document).ready ->
  keys = []
  konami = '38,38,40,40,37,39,37,39,66,65'

  $(document).on 'keydown', (e) ->
    keys.push(e.keyCode);
    if keys.toString().indexOf(konami) >= 0
        keys = []
        $("body").prepend '<iframe id="konami" src="//giphy.com/embed/jRx59nrqDtXHy" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>'
        $('#konami').css
          'z-index' : -1
          width: $(window).width()
          height: $(window).height()
          position: 'fixed'
