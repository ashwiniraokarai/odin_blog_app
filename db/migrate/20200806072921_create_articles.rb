class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      #columns added by me after because I did not specify any columns when
      #generating the model: bin/rails g model Article
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
