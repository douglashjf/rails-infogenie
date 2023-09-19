class RemoveKeyQuestionsFromSummaries < ActiveRecord::Migration[7.0]
  def change
    remove_column :summaries, :key_questions, :text
  end
end
