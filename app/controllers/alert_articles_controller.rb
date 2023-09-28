class AlertArticlesController < ApplicationController

  def cron
        # user_ids_with_favourites_array = Favourite.all.pluck(:user_id).uniq
    # which users have favourites
        # favourited_user_emails = User.all.where(id: user_ids_with_favourites_array).pluck(:email)
    # get their email
        # favourites_array_of_array = user_ids_with_favourites_array.map do |id|
        #   User.find(id).favourites
        # end
        # favouritesarray = favourites_array_of_array.flatten
    # which cards are favourites

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
