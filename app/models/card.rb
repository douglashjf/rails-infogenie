class Card < ApplicationRecord
  belongs_to :user
  has_many :summaries
  has_many :favourites

  scope :active, -> { where(deleted_at: nil) }

  validates :primary_keywords, :secondary_keywords, presence: true
  validates :primary_keywords, format: { with: /\D+/ }
end
