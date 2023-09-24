class AddCardIdToNews < ActiveRecord::Migration[7.0]
  def change
    add_reference :news, :card, null: false, foreign_key: true
  end
end
