require 'news-api'

class NewsArticle < ApplicationRecord
  belongs_to :card

  # Class method to fetch news articles from NewsAPI
  def self.fetch_articles(primary_keywords, card)
    # 1) create - api key
    newsapi = News.new(ENV.fetch('NEWSAPI_API_KEY'))

    # 2) define what i want to search
    query_params = {
      q: primary_keywords,
      language: 'en',
      sortBy: 'publishedAt',
      pageSize: 3
    }

    # 3 Fetch news articles from NewsAPI with my params
    all_articles = newsapi.get_everything(query_params)
    raise
  end
end
