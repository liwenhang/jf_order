class Store < ApplicationRecord
  belongs_to :user
  validates :name,  presence: true
  validates :intro, presence: true
end
