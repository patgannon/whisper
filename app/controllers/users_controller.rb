class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    raise params[:id]
    @user = User.find(params[:id])
  end
  
  def me
    redirect_to users_path(current_user.id)
  end
end
