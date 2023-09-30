class NewsAlertService
  def self.perform_cron

    # list of fav users
    favourite_users = Favourite.all.map(&:user)
    # list of favourite cards

    favourite_cards = Favourite.all.map(&:card)
    # iterate over favourite cards, and call api and add refreshed news to array
    favourite_cards.uniq.each do |card|
      news_articles = NewsArticle.fetch_articles(card.primary_keywords)
      card.news_articles << news_articles
    end


    favourite_users.uniq.each do |user|
      NewsMailer.with(user:, email: user.email).news_alert.deliver_later
    end
  end
end
