class HomeController < ApplicationController
  def index
    @playlist = Playlist.new
  end

  def styleguide
  end
end
