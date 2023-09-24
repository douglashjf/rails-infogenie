class AddForeignKeyToNews < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :news, :cards, column: :card_id
  end
end
