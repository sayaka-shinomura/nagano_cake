class Item < ApplicationRecord

  #1:Nの1にあたる側（items_id)
  has_many :cart_items, dependent: :destroy

  #1:Nの1にあたる側（items_id)
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details

  has_one_attached :image

end
