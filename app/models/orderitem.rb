class Orderitem < ActiveRecord::Base
  belongs_to :order
  attr_accessible :description, :item_id, :price, :quantity, :title
end
