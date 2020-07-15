class Clothe < ApplicationRecord

  has_many_attached :photos
  has_many :comments, dependent: :destroy
  monetize :price_cents

end
