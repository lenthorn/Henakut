class Piece < ActiveRecord::Base
  attr_accessible :artcolour, :artcolour, :artimage_url, :artist_id, :artmedium, :artstyle, :arttype, :name, :price, :stocknumber
  belongs_to :artist


end
