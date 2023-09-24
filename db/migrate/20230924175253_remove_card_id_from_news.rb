class RemoveCardIdFromNews < ActiveRecord::Migration[7.0]
  def change
    remove_column :news, :card_id, :bigint
  end
end
