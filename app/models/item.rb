class Item < ApplicationRecord
  
  #1:Nの1にあたる側（items_id)
  has_many :cart_items, dependent: :destroy
  
  #1:Nの1にあたる側（items_id)
  has_many :order_items, dependent: :destroy
  
end
