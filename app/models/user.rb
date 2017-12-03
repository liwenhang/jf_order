class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :stores, dependent: :destroy
  has_many :menus, through: :stores
  has_many :orders

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def super_admin?
    self.id == 1
  end

  def admin?
    self.has_role? :admin
  end

  def gender
    self.sex == 1 ? '男' : '女'
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.email = "#{auth.uid}@jforder.com"
      user.password = Devise.friendly_token[0,20]
      user.nickname = auth.info.nickname
      user.sex = auth.info.sex
      user.avatar = auth.info.headimgurl
      user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.wechat_data']
        user.provider = data['provider']
        user.uid = data['uid']
        user.nickname = data['info']['nickname']
        user.sex = data['info']['sex']
        user.avatar = data['info']['headimgurl']
      end
    end
  end

  def email_required?
    false
  end

end
