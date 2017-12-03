class Store < ApplicationRecord
  belongs_to :user
  has_many :menus, dependent: :destroy
  has_many :orders

  has_many :pictures, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :pictures, reject_if: :all_blank, allow_destroy: true

  validates :name,  presence: true, length: { maximum: 255 }
  validates :intro, presence: true, length: { maximum: 255 }

  def store_and_user
    "#{self.user.email} 的商铺：#{name}"
  end
end
