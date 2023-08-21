class Order < ApplicationRecord
  
  #1:NのN側（customer_id）
  
  #1:Nの1側（order_id）
  
  
  enum payment_method:{
    credit: 1, #クレジットカード
    bank: 2, #銀行振込
  }
end
