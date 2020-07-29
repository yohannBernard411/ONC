class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :clothe

  validates :title, presence: true
  validates :content, presence: true
  validates :note, presence: false, inclusion: { in: 0..5 }


end
