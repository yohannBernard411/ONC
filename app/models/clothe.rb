class Clothe < ApplicationRecord

  has_many_attached :photos
  has_many :comments, dependent: :destroy
  has_many :line_items
  has_many :dyeing, dependent: :destroy
  has_many :scaling, dependent: :destroy
  monetize :price_cents

  validates :name, presence: true
  validates :category, presence: true
  validates :price_cents, presence: true
  validates :stock, presence: true

end
