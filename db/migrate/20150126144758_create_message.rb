class CreateMessage < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.references :user, index: true
      t.timestamps # created_at, updated_at
     end
    add_foreign_key :messages, :users
  end
end
