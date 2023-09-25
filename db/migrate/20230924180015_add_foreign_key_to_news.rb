class AddForeignKeyToNews < ActiveRecord::Migration[7.0]
  def change
    add_column :news, :card_id, :bigint
    add_foreign_key :news, :cards, column: :card_id
  end
end
