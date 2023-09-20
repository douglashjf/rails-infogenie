class Card < ApplicationRecord
  belongs_to :user
  has_many :summaries
  has_many :favourites
  has_many :card_categories
  has_many :categories, through: :card_categories
  CATEGORIES = %w[ Life Health Relationships Self Improvement Productivity Mindfulness Work Technology Blockchain Data Science Technology Software Development Media Art Gaming Society Economics Education Equality Culture Philosophy Religion Spirituality World Nature Travel ]

  scope :active, -> { where(deleted_at: nil) }

  validates :primary_keywords, :secondary_keywords, presence: true
  validates :primary_keywords, format: { with: /\D+/ }
end
