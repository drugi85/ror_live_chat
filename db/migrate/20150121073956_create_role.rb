class CreateRole < ActiveRecord::Migration
  def up
    create_table :roles do |t|
      t.string :name
      t.timestamps
    end
    add_index :roles, :name, :unique => true
  end

  def down
  	remove_index :roles, :name
  	drop_table :roles
  end
end
