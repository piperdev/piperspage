class AddAdminAndNameToUser < ActiveRecord::Migration
  def up
    add_column :users, :name, :string
    add_column :users, :admin, :boolean

    execute %{
      UPDATE users SET name = 'Default';
      UPDATE users SET admin = false;
    }

    change_column :users, :name, :string, :null => false
    change_column :users, :admin, :boolean, :null => false
  end

  def down
    remove_column :users, :name
    remove_column :users, :admin
  end
end
