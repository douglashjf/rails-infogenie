class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :card

  validates :content, presence: true
end
