class Order < ApplicationRecord
  belongs_to :user
  belongs_to :clothe

  monetize :amount_cents
end
