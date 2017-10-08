class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :forbide_modify_super_admin, only: [:update, :destroy]

  def index
    @users = User.page params[:page]
  end

  def show
  end

  def edit
  end

  def update
    @user.role_ids = params[:user][:role_ids]
    redirect_to edit_user_path(@user), notice: '权限修改成功'
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: "资料删除成功！"
  end

  private

    def set_user
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit(:email, :password)
    end

    def forbide_modify_super_admin
      @user = User.find params[:id]
      if @user.super_admin?
        redirect_to users_url, alert: '不能对此账号进行操作！'
      end
    end
end
