class EntriesController < ApplicationController

  def index
    @entries = Entry.all.order(published: :desc).page(params[:page]).per(10)

    if blog_id = params[:blog_id]
      @entries = @entries.where(blog_id: blog_id)
    end

    respond_to do |format|
       format.json { render json: @entries, status: 200 }
       format.xml { render json: @entries, status: 200 }
       format.html { render :index }
    end   
    
  end

  def show
    @entry = Entry.find(params[:id])
    
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to entries_path
  end

  def add_entry_to_bookmarks
    @entry = Entry.find(params[:id])
    @user = User.find(params[:id])
    add_entry_to_bookmarks!(@user, @entry)
    redirect_to user_entries_path 
  end

  def remove_from_bookmarks
    @entry = Entry.find(params[:id])
    @user = current_user.id
    @user.remove_from_bookmarks!(@user, @entry)
    redirect_to user_entries_path 
  end

end
