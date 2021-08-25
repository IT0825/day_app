class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :move_to_index, only: :show
  before_action :metastasis_show, only: [:index, :edit, :update]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "ユーザー情報「#{@user.name}」さんを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, notice: "ユーザー「#{user.name}」さんを削除しました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
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

  def metastasis_show
    unless admin_signed_in?
      redirect_to action: :show
    end
  end
end
