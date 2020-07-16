class Cart < ApplicationRecord
  has_many :line_items
  has_many :clothe, through: :line_items
end
