class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :stores, dependent: :destroy
  has_many :menus, through: :stores

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def super_admin?
    self.id == 1
  end

  def admin?
    self.has_role? :admin
  end
end
