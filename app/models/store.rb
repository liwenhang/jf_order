class Store < ApplicationRecord
  belongs_to :user
  has_many :menus, dependent: :destroy
  has_many :orders

  has_one :picture, as: :imageable, dependent: :destroy

  validates :name,  presence: true, length: { maximum: 255 }
  validates :intro, presence: true, length: { maximum: 255 }

  default_scope -> { order(created_at: :DESC) }

  def store_and_user
    "#{self.user.email} 的商铺：#{name}"
  end
end
