class CartItem < ApplicationRecord
  
  #1:NのNにあたる側（items_id)
  belongs_to :item
  
end
