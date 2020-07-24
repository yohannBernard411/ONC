class Clothe < ApplicationRecord

  has_many_attached :photos #cloudinary

  # has_many :comments, dependent: :destroy
  monetize :price_cents
  
  # has_many :line_items
  # has_many :carts, through: :line_items

end
