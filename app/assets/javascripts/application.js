// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require d3.v3.min

var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var ytCanPlay = false;

function onYouTubeIframeAPIReady() {
  ytCanPlay = true;
}

var playButton = {
    el: document.querySelector(".js-button"),

    iconEls: {
        playing: document.querySelector("#pause-icon"),
        paused:  document.querySelector("#play-icon")
    },

    nextState: {
        playing: "paused",
        paused:  "playing"
    },

    animationDuration: 350,

    init: function () {
        this.setInitialState();
        this.replaceUseEl();
        this.el.addEventListener("click", this.toggle.bind(this));
    },

    setInitialState: function () {
      var initialIconRef = this.el.querySelector("use").getAttribute("xlink:href");
      this.state = this.el.querySelector(initialIconRef).getAttribute("data-state");
    },

    replaceUseEl: function () {
        d3.select(this.el.querySelector("use")).remove();
        d3.select(this.el.querySelector("svg")).append("path")
            .attr("class", "js-icon")
            .attr("d", this.stateIconPath());
    },

    toggle: function () {
        this.goToNextState();

        d3.select(this.el.querySelector(".js-icon")).transition()
            .duration(this.animationDuration)
            .attr("d", this.stateIconPath());
    },

    goToNextState: function () {
        this.state = this.nextState[this.state];
    },

    stateIconPath: function () {
        return this.iconEls[this.state].getAttribute("d");
    }
};

playButton.init();
