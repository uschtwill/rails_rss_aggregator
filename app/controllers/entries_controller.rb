class EntriesController < ApplicationController

  def index    
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "OaPIa6c82YEEaFVB8C4WKvWza"
      config.consumer_secret     = "txb7PCdjv423WIUpBTnGFzMNAPxnt7O69t2k0fDMOjD6J4nXr0"
      config.access_token        = "3094798869-J4XQ1Ml9H4phtk6fQ5v3df6Go0aPvN8IXkYeplK"
      config.access_token_secret = "hop2ORt39UtT8JZc94rX5UnGQ0sdwGcjk9Dak3zSmk8tV"
    end
    
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
    
    respond_to do |format|
       format.json { render json: @entry, status: 200 }
       format.xml { render json: @entry, status: 200 }
       format.html { render :show }
    end

  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to entries_path
  end

end
