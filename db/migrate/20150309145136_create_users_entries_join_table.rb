class CreateUsersEntriesJoinTable < ActiveRecord::Migration
  def change
    create_table :users_entries, id: false do |t|
      t.integer :user_id
      t.integer :entry_id
    end
 
    add_index :users_entries, :user_id
    add_index :users_entries, :entry_id
  end

end