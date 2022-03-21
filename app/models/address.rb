class Address < ApplicationRecord
  belongs_to :customer

  validates :name, :address , :postal_code , presence: true


end
