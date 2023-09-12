class RemoveContentFromCards < ActiveRecord::Migration[7.0]
  def change
    remove_column :cards, :content, :text
  end
end
