class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_deposit: 0, payment_confirmation: 1, in_production: 2, prepairing_to_ship: 3, shipped: 4 }
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
