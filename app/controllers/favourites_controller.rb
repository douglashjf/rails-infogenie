class FavouritesController < ApplicationController
  def index
    @favourites = current_user.favourites
  end
end
