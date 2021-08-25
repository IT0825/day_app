class UsersController < ApplicationController
  before_action :set_user, only: :show
  before_action :move_to_index, only: :show

  def index
    @users = User.all
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def move_to_index
    if user_signed_in?
      redirect_to root_path if current_user.id != @user.id
    elsif admin_signed_in?
    else
      redirect_to root_path
    end
  end
end
