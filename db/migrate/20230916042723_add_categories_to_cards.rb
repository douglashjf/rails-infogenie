class AddCategoriesToCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :categories, :text, array: true, default: []
  end
end
