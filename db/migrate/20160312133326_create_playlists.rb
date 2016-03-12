class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name, null: false
      t.datetime :played_at

      t.timestamps null: false
    end
  end
end
