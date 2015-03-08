class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
    @entries = @blog.entries.all.order(published: :asc)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create(blog_params)
    redirect_to blogs_path
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
    redirect_to blog_path(@blog)
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  def download_newest_entries
    @blog = Blog.find(params[:id])
    @blog.download_newest_entries!(params[:download_entries][:entries_num].to_i)
    # redirect_to blog_path(@blog)
  end

  # def download_newest_entries
  #   @blogs = Blog.all
  #   @blogs.each do |blog|
  #     blog.download_newest_entries!(params[:download_entries][:entries_num].to_i)
  #   end
  #   redirect_to entries_path
  # end

  # def update_all_blogs
  #   Blog.update_all_blogs
  #   redirect_to entries_path
  # end

  def update_all_blogs
    @blogs = Blog.all
    @blogs.each do |blog|
      blog.update_feed!
    end
    redirect_to entries_path
  end


  private

  def blog_params
    params.require(:blog).permit(:url)
  end
end
