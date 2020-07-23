class Comment < ApplicationRecord
  belongs_to :clothe
  belongs_to :user
end
