class AddNameToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :name, :string
  end
end
