class Order < ActiveRecord::Base
  belongs_to :user
  attr_accessible :order_date
	
  has_many :orderitems
  belongs_to :user

end
