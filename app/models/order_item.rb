class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum status: { start_not_possible:0, production_pending:1, in_production:2, production_complete:3 }

  def taxin_price
    price*1.1
  end
end
