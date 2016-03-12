class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.string :artist, null: false
      t.boolean :played, default: false
      t.string :provider, null: false
      t.string :provider_track_id, null: false
      t.integer :upvote, default: 0
      t.integer :downvote, default: 0
      t.references :playlist, null: false

      t.timestamps null: false
    end
  end
end
