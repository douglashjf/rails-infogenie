class ChangeArrayTostringInCategories < ActiveRecord::Migration[7.0]
  def change
    change_column :categories, :tag, :string, array: false, default: ""
  end
end
