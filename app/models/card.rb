class Card < ApplicationRecord
  belongs_to :user
  has_many :summaries
  has_many :comments
  has_many :favourites
  has_many :card_categories
  has_many :categories, through: :card_categories
  has_many :news_articles
  CATEGORIES = %w[ Life Health Relationships Self Improvement Productivity Mindfulness Work Technology Blockchain Data Science Software Development Media Art Gaming Society Economics Education Equality Culture Philosophy Religion Spirituality World Nature Travel ]

  scope :active, -> { where(deleted_at: nil) }

  validates :primary_keywords, :secondary_keywords, presence: true
  validates :primary_keywords, format: { with: /\D+/ }

  include PgSearch::Model

  pg_search_scope :search_by_keyword,
    against: [:primary_keywords, :secondary_keywords],

    using: {
      tsearch: { prefix: true },
      trigram: {}
    }

  def self.search_by_keyword(query)
    where("primary_keywords ILIKE :query OR secondary_keywords ILIKE :query", query: "%#{query}%")
  end
end
