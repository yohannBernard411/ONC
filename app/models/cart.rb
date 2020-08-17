class Cart < ApplicationRecord
  # has_one :user
  has_one :order
  has_many :line_items
  
  monetize :price_cents

  validates :state, inclusion: { in: %w(awaiting paid manufacturing pending dispatched closed),
  message: "%{value} is not a valid state" }
end
