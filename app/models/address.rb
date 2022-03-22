class Address < ApplicationRecord
  belongs_to :customer

  validates :name, :address , :postal_code , presence: true

  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end

end
