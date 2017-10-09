class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

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

end
