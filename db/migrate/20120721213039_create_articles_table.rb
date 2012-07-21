class CreateArticlesTable < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, :null => false
      t.text :body, :null => false
      t.boolean :featured

      t.timestamps
    end
  end
end
