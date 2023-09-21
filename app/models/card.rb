class Card < ApplicationRecord
  belongs_to :user
  has_many :summaries
  has_many :favourites
  CATEGORIES = %w[ Life Health Relationships Self Improvement Productivity Mindfulness Work Technology Blockchain Data Science Technology Software Development Media Art Gaming Society Economics Education Equality Culture Philosophy Religion Spirituality World Nature Travel ]

  scope :active, -> { where(deleted_at: nil) }

  validates :primary_keywords, :secondary_keywords, presence: true
  validates :primary_keywords, format: { with: /\D+/ }

  include PgSearch::Model

  pg_search_scope :search_by_query,
                  against: %i[primary_keywords secondary_keywords categories],
                  associated_against: {
                    user: :first_name
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
