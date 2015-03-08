class EntriesController < ApplicationController

  def index
    @entries = Entry.all.order(published: :desc)

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
    respond_to do |format|
       format.json { render json: @entry, status: 200 }
       format.xml { render json: @entry, status: 200 }
       format.html { render :index }
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to entries_path
  end
end
