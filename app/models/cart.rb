class Cart < ApplicationRecord
  # has_one :user
  has_one :order
  has_many :line_items
  
  monetize :price_cents

  validates :state, inclusion: { in: ["panier", "payé", "réalisation", "réalisé", "envoi", "cloturé"],
  message: "%{value} is not a valid state" }
end
