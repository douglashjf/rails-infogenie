class AddImageUrlToCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :image_url, :string
  end
end
