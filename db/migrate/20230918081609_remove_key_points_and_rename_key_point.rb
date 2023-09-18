class RemoveKeyPointsAndRenameKeyPoint < ActiveRecord::Migration[7.0]
  def change
    remove_column :summaries, :key_points
    rename_column :summaries, :key_point, :key_points
  end
end
