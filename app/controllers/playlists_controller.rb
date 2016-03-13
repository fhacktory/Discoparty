class PlaylistsController < ApplicationController
  before_action :set_cookie

  def create
    @playlist = Playlist.find_or_create_by(playlist_params)

    if @playlist.save
      redirect_to @playlist
    else
      render 'home/index'
    end
  end

  def show
    @playlist = Playlist.find(params[:id])

    @qr = RQRCode::QRCode.new( params[:id], :size => 1, :level => :l )
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
