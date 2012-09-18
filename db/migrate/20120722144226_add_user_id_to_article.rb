class AddUserIdToArticle < ActiveRecord::Migration
  def up
    add_column :articles, :user_id, :integer, references: :users

    user = User.find_or_create_by_email(email: "default@piperspage.com", password: "abc123")
    execute "UPDATE articles SET user_id = #{user.id}"

    change_column :articles, :user_id, :integer, null: false, references: :users
  end

  def down
    remove_column :articles, :user_id
  end
end
