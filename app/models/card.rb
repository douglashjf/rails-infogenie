class Card < ApplicationRecord
  belongs_to :user
  has_many :summaries
end
