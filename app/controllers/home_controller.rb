class HomeController < ApplicationController
  def index
    @playlist = Playlist.new

    @qr = RQRCode::QRCode.new( 'discoparty', :size => 1, :level => :l )
  end
end
