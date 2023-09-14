class CardsController < ApplicationController
  before_action :set_cards, only: %i[show toggle_favourites delete]

  def index
    @cards = Card.active
  end

  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(params_cards)
    @card.user = current_user

    if @card.save
      redirect_to card_path(@card)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def toggle_favourites
    if current_user.favourites.exists?(card: @card)
      current_user.favourites.where(card: @card).destroy_all
    else
      Favourite.create(user: current_user, card: @card)
    end
  end

  def delete
    @card.deleted_at = DateTime.now
    @card.save
    redirect_to cards_path
  end

  private

  def set_cards
    @card = Card.find(params[:id])
  end

  def params_cards
    params.require(:card).permit(:primary_keywords, :secondary_keywords)
  end

end
