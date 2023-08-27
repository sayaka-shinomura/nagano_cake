class CartItem < ApplicationRecord
  
  #1:NのNにあたる側（costomer_id)
  belongs_to :customer
  
  #1:NのNにあたる側（item_id)
  belongs_to :item
  
  has_one_attached :image
  
end
