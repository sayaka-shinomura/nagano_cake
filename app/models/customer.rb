class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #1:Nの1側（order_id）
  has_many :cart_items, dependent: :destroy

  #1:Nの1側（order_id）
  has_many :orders, dependent: :destroy

  has_one_attached :image

  # is_deletedがfalseならtrueを返す
  def active_for_authentication?
    super && (is_deleted == false)
  end

  #姓と名を一列で表示
  def full_name
    self.last_name + " " + self.first_name
  end

end
