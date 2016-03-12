class RemoveNullConstraintOnTracksDuration < ActiveRecord::Migration
  def change
    change_column :tracks, :duration, :integer, null: true
  end
end
