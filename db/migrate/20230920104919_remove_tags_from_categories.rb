class RemoveTagsFromCategories < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :tags
  end
end
