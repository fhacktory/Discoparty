# Discoparty [![Build Status](https://travis-ci.org/fhacktory/Discoparty.svg?branch=master)](https://travis-ci.org/fhacktory/Discoparty)

DiscoParty is a social and collaborative music playlist web application.

Perfect for the situation when your friend ask you to add some tracks on the audio background of the party.

Your friends can download an application for their smartphone and scan the code displayed on the playlist or go to the discoparty url adding `/playlists/#{playlist_id}`.
Then they can like, dislike some tracks to change the order of the playlist.

At this moment, Deezer, Soundcloud and Youtube connectors are developed.

This app was created in 24h during the fhacktory 2016/03.

:bulb: For Deezer, you need to be connected on the browser where the playlist is launch.

The playlist is synchronized on the server, so you can listen synchronously this playlist everwhere in the world in the same time as your friend !

## Getting Started

This repository comes equipped with a self-setup script!

    % ./bin/setup

After setting up, you can run the application using [Heroku Local]:

    % heroku local

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local

## Deploying

If you have previously run the `./bin/setup` script,
you can deploy to staging and production with:

    $ ./bin/deploy staging
    $ ./bin/deploy production

## Mobile application
[Git repository]: https://github.com/gouz/discoparty-app

See : [Git repository]
