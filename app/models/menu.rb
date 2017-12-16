class Menu < ApplicationRecord
  belongs_to :store

  has_many :pictures, as: :imageable, dependent: :destroy

  validates :name,  presence: true, length: { maximum: 255 }
  validates :intro, presence: true, length: { maximum: 255 }
  validates :price, presence: true, numericality: { greater_than: 0 }

  default_scope -> { order(created_at: :desc) }
end
