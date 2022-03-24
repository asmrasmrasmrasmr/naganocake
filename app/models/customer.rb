class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #3/19崎田　配送先登録・一覧のため追記　3/20 dependent追記
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def full_address
    '〒' + postal_code + ' ' + address + ' ' + last_name + ' ' + first_name
  end

end
