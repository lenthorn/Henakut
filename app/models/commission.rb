class Commission < ActiveRecord::Base
  attr_accessible :artist, :colour, :email, :name, :style, :image, :remote_image_url

  mount_uploader :image, ImageUploader
end
