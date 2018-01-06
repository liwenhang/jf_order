class Address < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :phone_number, presence: true
  validates :info, presence: true

end
