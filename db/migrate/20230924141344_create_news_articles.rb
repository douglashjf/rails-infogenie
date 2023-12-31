class CreateNewsArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :news_articles do |t|
      t.text :title
      t.text :description
      t.text :url
      t.datetime :published_at
      t.string :name
      t.references :card, null: false, foreign_key: true
      t.timestamps
    end
  end
end
