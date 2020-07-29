class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :clothe

  validations :title, presence: true
  validations :content, presence: true
  validations :note, presence: false, inclusion: { in: 0..5 }


end
