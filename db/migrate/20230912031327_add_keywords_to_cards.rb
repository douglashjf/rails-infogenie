class AddKeywordsToCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :primary_keywords, :string
    add_column :cards, :secondary_keywords, :string
  end
end
