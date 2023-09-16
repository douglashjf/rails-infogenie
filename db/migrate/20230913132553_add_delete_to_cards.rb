class AddDeleteToCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :deleted_at, :datetime
  end
end
