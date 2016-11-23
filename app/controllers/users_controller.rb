class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # logger.tagged('user.index') { logger.info current_user }
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end
end
