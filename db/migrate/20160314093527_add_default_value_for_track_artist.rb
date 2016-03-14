class AddDefaultValueForTrackArtist < ActiveRecord::Migration
  def change
    change_column :tracks, :artist, :string, default: 'Unknown artist'
  end
end
