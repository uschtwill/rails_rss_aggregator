class UsersController < ApplicationController

  def entries
    @user = User.find(params[:id])
    @entries = @user.entries
  end

  def add_entry_to_bookmarks
    @entry = Entry.find(params[:id])
    @user = User.find(params[:id])
    add_entry_to_bookmarks!(@user, @entry)
    redirect_to user_entries_path 
  end

  def remove_entry_from_bookmarks
    @entry = Entry.find(params[:id])
    @user = current_user.id
    @user.remove_entry_from_bookmarks!(@user, @entry)
    redirect_to user_entries_path 
  end
  
end