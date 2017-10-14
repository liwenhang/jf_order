class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true, required: false
  mount_uploader :name, PictureUploader
end
