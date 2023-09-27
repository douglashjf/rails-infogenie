class AlertArticlesController < ApplicationController

  def
    user_ids_with_favourites_array = Favourite.all.pluck(:user_id).uniq
    # which users have favourites
    favourited_user_emails = User.all.where(id: user_ids_with_favourites_array).pluck(:email)
    # get their email
    user_ids_with_favourites_array.each do |id|
      User.find(id).favourites
    end
    # which favourites are linked to which users above

  end
end
