class CartItem < ApplicationRecord
  belongs_to :item
  has_many :orders

  def subtotal
    item.add_tax_price * amount
  end
end
