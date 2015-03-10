class UsersController < ApplicationController

  def entries
    @user = User.find(params[:id])
    @entries = @user.entries
  end

end