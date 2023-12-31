require 'news-api'

class NewsArticle < ApplicationRecord
  belongs_to :card

  # Class method to fetch news articles from NewsAPI
  def self.fetch_articles(primary_keywords, secondary_keywords)
    # 1) create - api key
    newsapi = News.new(ENV.fetch('API_KEY'))


    # 2 Fetch news articles from NewsAPI with my params
    articles = newsapi.get_everything(
      q: "#{primary_keywords} AND #{secondary_keywords}",
      domains: "bbc.com,techcrunch.com,cnn.com,bloomberg.com,wsj.com,coindesk.com,cointelegraph.com,ledgerinsights.com,wired.com,theverge.com,cnet.com,engadget.com,gizmodo.com",
      language: 'en',
      sortBy: 'publishedAt',
      pageSize: 30
    )

    articles.sample(3).reject { |article| article.title == "[Removed]" }.map do |article_data|
      NewsArticle.new(
        title: article_data.title,
        description: article_data.description,
        url: article_data.url,
        published_at: article_data.publishedAt
      )
    end
  end
end
