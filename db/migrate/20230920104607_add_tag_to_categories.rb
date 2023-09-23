class AddTagToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :tag, :string, array: true, default: []
  end
end
