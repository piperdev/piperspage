class CreateEditionsTable < ActiveRecord::Migration
  def change
    create_table "editions" do |t|
      t.timestamps
    end
  end
end
