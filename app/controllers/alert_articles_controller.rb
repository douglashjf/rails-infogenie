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
    favorite_users = Favorite.all.map(&:user)
    favorite_cards = Card.where(user_id: favorite_users.pluck(:id))
    # list of favourite cards
  end
end
