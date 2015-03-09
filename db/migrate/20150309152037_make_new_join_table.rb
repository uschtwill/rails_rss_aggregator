class MakeNewJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :entries do |t|
      t.index :user_id
      t.index :entry_id
    end
  end
end
