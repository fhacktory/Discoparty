class HomeController < ApplicationController
  def index
    @playlist = Playlist.new
  end
end
