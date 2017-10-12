class Store < ApplicationRecord
  belongs_to :user
  has_many :menus, dependent: :destroy

  validates :name,  presence: true
  validates :intro, presence: true

  def store_and_user
    "#{self.user.email} 的商铺：#{name}"
  end
end
