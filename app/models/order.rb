class Order < ApplicationRecord

  #1:NのNにあたる側（costomer_id)
  belongs_to :customer

  #1:Nの1側（order_id）
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details

  has_one_attached :image

  enum payment_method: { credit_card: 0, transfer: 1 }
  #0がクレジットカード、1が銀行振り込み


end
