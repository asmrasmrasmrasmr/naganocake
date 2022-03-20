class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #3/19崎田　配送先登録・一覧のため追記　3/20 dependent追記
  has_many :addresses, dependent: :destroy

  def active_for_authentication?
    super && (is_deleted == false)
  end

end
