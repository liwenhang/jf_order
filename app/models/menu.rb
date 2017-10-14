class Menu < ApplicationRecord
  belongs_to :store
  has_many :pictures, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for(:pictures,
                                reject_if: :all_blank,
                                allow_destroy: true)
end
