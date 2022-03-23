class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { 入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4 }
  has_one_attached :image

  def full_addresses
    '〒' + postal_code + ' ' + address + ' ' + name
  end

  def taxin_price
   price*1.1
  end

  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

end
