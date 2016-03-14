# Discoparty [![Build Status](https://travis-ci.org/fhacktory/Discoparty.svg?branch=master)](https://travis-ci.org/fhacktory/Discoparty)

DiscoParty is a social and collaborative playlist web application.

Currently living at : http://discoparty.herokuapp.com

It's perfect for the situation when your friend ask you to add some tracks on the audio background of the party. They now can do it by theirselves !

Your friends can download an application for their smartphone and scan the code displayed on the playlist or go to the discoparty url adding `/playlists/#{playlist_id}`.
Users can like and dislike some tracks to change the order of the playlist.

At this moment, Deezer, Soundcloud and Youtube connectors are developed.

This app was created in 24h during the fhacktory 2016/03.

:bulb: You need to have a session opened on http://www.deezer.fr, otherwise sounds playing from deezer would be only 30seconds samples.

The playlist is synchronized on the server, so you can listen synchronously this playlist everwhere in the world in the same time as your friend !

## Getting Started

This repository comes equipped with a self-setup script!

    % ./bin/setup

After setting up, you can run the application using [Heroku Local]:

    % heroku local

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local

## Deploying

You can easily deplor to heroku. You just need to create an heroku account, clone this repository and add heroku remotes to it.
Then don't forget to set heroku environment variables present in .sample.env (you need to create applications for youtube and soundcloud).

## Mobile application (work in progress)
[Git repository]: https://github.com/gouz/discoparty-app

See : [Git repository]

## Contribute
Feel free to clone, fork, open issues and pull requests to this repository. May the power of the open source world be with us !

## Licence
MIT
