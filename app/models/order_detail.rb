class OrderDetail < ApplicationRecord
  
  enum making_status: { unable_to_start: 0, waiting_for_production: 1, now_at_work: 2, production_complete: 3, sent: 4 }
  
  belongs_to :order
  belongs_to :item
  
end
