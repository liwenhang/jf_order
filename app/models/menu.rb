class Menu < ApplicationRecord
  belongs_to :store

  has_many :pictures, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :pictures, reject_if: :all_blank, allow_destroy: true

  validates :name,  presence: true, length: { maximum: 255 }
  validates :intro, presence: true, length: { maximum: 255 }
  validates :price, presence: true, numericality: { greater_than: 0 }
end
