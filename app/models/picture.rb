class Picture < ApplicationRecord
  mount_uploader :picture, PictureUploader

  belongs_to :imageable, polymorphic: true, required: false

  def url
    picture.url
  end
end
