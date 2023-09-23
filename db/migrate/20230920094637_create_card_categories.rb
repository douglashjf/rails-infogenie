class CreateCardCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :card_categories do |t|
      t.references :card, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
