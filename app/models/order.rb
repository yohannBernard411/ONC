class Order < ApplicationRecord
  has_one :cart
  monetize :amount_cents
end
