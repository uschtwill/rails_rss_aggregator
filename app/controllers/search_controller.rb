class SearchController < ApplicationController

  def search
    if params[:q].nil?
      @entries = []
    else
      @entries = Entry.search params[:q]
    end
  end

end
