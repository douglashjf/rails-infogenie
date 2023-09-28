class AlertArticlesController < ApplicationController

  def cron
    user_ids_with_favourites_array = Favourite.all.pluck(:user_id).uniq
    # which users have favourites
    favourited_user_emails = User.all.where(id: user_ids_with_favourites_array).pluck(:email)
    # get their email
    favourites_array_of_array = user_ids_with_favourites_array.map do |id|
      User.find(id).favourites
    end
    favouritesarray = favourites_array_of_array.flatten
    # which cards are favourites
    favourite_users = Favourite.all.map(&:user)
    favourite_cards = Card.where(user_id: favourite_users.pluck(:id))
    # list of favourite cards

    NewsMailer.with(user: favourite_users[0].first_name, emails: User.all.pluck(:email)).news_alert.deliver_later
  end
end
