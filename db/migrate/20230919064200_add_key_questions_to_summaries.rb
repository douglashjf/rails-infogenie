class AddKeyQuestionsToSummaries < ActiveRecord::Migration[7.0]
  def change
    add_column :summaries, :key_questions, :string, array: true, default: []
  end
end
