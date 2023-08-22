class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #1:Nの1側（order_id）
  has_many :cart_items, dependent: :destroy

  #1:Nの1側（order_id）
  has_many :orders, dependent: :destroy

end
