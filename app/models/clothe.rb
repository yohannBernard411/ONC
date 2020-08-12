class Clothe < ApplicationRecord

  has_many_attached :photos
  has_many :comments, dependent: :destroy
  has_many :line_items
  has_many :dyeings, dependent: :destroy
  has_many :scalings, dependent: :destroy
  has_many :colors, through: :dyeings
  has_many :sizes, through: :scalings

  translates :name, :description, :category, :delivery, :option

  monetize :price_cents

  validates :name, presence: true
  validates :category, presence: true
  validates :price_cents, presence: true
  validates :stock, presence: true

end
