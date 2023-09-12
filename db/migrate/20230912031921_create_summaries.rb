class CreateSummaries < ActiveRecord::Migration[7.0]
  def change
    create_table :summaries do |t|
      t.text :key_points
      t.text :key_questions
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
