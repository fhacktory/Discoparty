class PlaylistsController < ApplicationController
  def create
    @playlist = Playlist.new(playlist_params)

    if @playlist.save
      redirect_to @playlist
    else
      render 'home/index'
    end
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
