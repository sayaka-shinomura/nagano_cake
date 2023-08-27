class OrderDetail < ApplicationRecord
  
  #1:NのN側（order_id)
  belongs_to :order
  
  #1:NのN側（item_id)
  belongs_to :item
  
  has_one_attached :image
  
  
end
