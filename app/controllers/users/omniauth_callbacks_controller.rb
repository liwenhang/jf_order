class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  layout 'wechat'

  def wechat
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in @user, event: :authentication
    session['devise.wechat_data'] = request.env['omniauth.auth']
    render 'home/wechat'
  end

  def failure
    redirect_to root_path
  end
end
