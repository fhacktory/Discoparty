class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :vote_type, null: false
      t.references :track, null: false
      t.references :user, null: false

      t.timestamps null: false
    end
  end
end
