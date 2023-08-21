class Order < ApplicationRecord
  
  #1:NのN側（customer_id）
  
  #1:Nの1側（order_id）
  has_many :order_details, dependent: :destroy
  
  enum payment_method:{
    credit: 1, #クレジットカード
    bank: 2, #銀行振込
  }
end
