class AddCardToNewsArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :news_articles, :card, null: false, foreign_key: true
  end
end
