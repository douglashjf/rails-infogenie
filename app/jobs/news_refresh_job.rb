class NewsRefreshJob < ApplicationJob
  queue_as :default

  def perform
    puts "I'm starting the fake job"
    sleep 3
    puts "OK I'm done now"
  end
end


# # 1) check ALL cards and retrieve cards that is favourited by user
    # favored_cards = Card.joins(:favourites).distinct


    # # 2) perform refresh logic on all favoured cards and find out each card users
    # favored_cards.each do |card|
    #   # refresh logic
    #   card.refresh_articles
    #   puts "cards article refresh"
    #   # Actionailer
    #   # card.favourites.each do |favourite|
    #   #   user = favourite.user
    #   #   NewsNotificationMailer.news_updated(user, card).deliver_now
    #   # end
    # end
