class AddPlayingToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :playing, :boolean, default: false
  end
end
