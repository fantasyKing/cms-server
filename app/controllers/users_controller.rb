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

  def edit
      @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id]).delete
    redirect_to :back, notice: "Deleted." #dashboard_users_path
  end

  def create
    @user = User.create(user_params)
    redirect_to :back, notice: "Created." #dashboard_users_path
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to :back, notice: "Updated." #dashboard_users_path
    end      
  end

  def import
    User.import(params[:file])
    redirect_to :back, notice: "Imported."
  end
  def new
    @user = User.new
  end
  private
  def user_params
    params.require(:user).permit(User.valid_attrs)
  end
end
