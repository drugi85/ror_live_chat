class CreateUser < ActiveRecord::Migration
	def up
		create_table :users do |t|
			t.string :name
			t.string :email
			t.integer :role_id
			t.timestamps
		end
		add_index :users, :role_id
		add_index :users, :email, :unique => true
	end

	def down
		remove_index :users, :role_id
		remove_index :users, :email
		drop_table :users
	end
end
