require 'news-api'

class NewsArticle < ApplicationRecord
  belongs_to :card

  # Class method to fetch news articles from NewsAPI
  def self.fetch_articles(primary_keywords)
    # 1) create - api key
    newsapi = News.new(ENV.fetch('NEWSAPI_API_KEY'))


    # 2 Fetch news articles from NewsAPI with my params
    articles = newsapi.get_everything(
      q: "#{primary_keywords}",
      language: 'en',
      sortBy: 'publishedAt',
      pageSize: 3
    )

    articles.map do |article_data|
      NewsArticle.new(
        title: article_data.title,
        description: article_data.description,
        url: article_data.url,
        published_at: article_data.publishedAt
      )
    end
  end
end
