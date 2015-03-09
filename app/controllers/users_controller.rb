class UsersController < ActionController::Base

  def entries
    @user = User.find(params[:id])
    @entries = @user.entries
  end

end