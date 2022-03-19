class Address < ApplicationRecord


  validates :name, :address , :postal_code , presence: true


end
