class DropTable < ActiveRecord::Migration
  def change
    drop_table :users_entries
  end
end
