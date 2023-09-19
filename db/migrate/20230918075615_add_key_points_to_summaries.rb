class AddKeyPointsToSummaries < ActiveRecord::Migration[7.0]
  def change
    add_column :summaries, :key_point, :string, array: true, default: '{}'
  end
end
