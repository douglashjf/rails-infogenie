class RemoveCategoriesFromCards < ActiveRecord::Migration[7.0]
  def change
    remove_column :cards, :categories
  end
end
