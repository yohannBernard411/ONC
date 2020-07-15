class Comment < ApplicationRecord
  belongs_to :clothe

  validates :content, presence: true
end
