class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :clothe

  validates :quantity, presence: true
  
end
