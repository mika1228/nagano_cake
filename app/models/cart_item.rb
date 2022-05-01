class CartItem < ApplicationRecord
  belongs_to :item
  has_many :orders
  belongs_to :customer

  def subtotal
    item.add_tax_price * amount
  end
end
