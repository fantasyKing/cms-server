class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users_grid = UsersGrid.new(params[:users_grid]) do |scope|
      scope.page(params[:page]).per(10)
    end
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end
end
