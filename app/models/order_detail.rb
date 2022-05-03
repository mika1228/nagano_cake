class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
    
  enum making_status: { cannot_make: 0, waiting_for: 1, making: 2, making_completed: 3 }
end
