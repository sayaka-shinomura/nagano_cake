class Order < ApplicationRecord

  #1:NのNにあたる側（costomer_id)
  belongs_to :customer

  #1:Nの1側（order_id）
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details

  has_one_attached :image

  enum payment_method:{
    credit: 1, #クレジットカード
    bank: 2, #銀行振込
  }
end
