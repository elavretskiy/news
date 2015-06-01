class CreateNewsArticles < ActiveRecord::Migration
  def change
    create_table :news_articles do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.string :annonce, null: false

      t.timestamps null: false
    end
  end
end
