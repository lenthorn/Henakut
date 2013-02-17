class Artist < ActiveRecord::Base
  attr_accessible :artistimage_url, :artistname, :artstyle, :arttype, :bio, :featuredartist
  has_many :pieces
end
