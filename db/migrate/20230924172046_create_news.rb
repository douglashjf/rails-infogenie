class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :source_name
      t.string :title
      t.text :description
      t.string :url
      t.datetime :published_at

      t.timestamps
    end
  end
end
