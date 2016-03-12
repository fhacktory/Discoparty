class AddImageUrlToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :image_url, :string
  end
end
