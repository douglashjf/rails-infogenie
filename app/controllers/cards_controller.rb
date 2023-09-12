class CardsController < ApplicationController
  before_action :set_cards, only: %i[show destroy]

  def index
    @cards = Card.all
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

  def destroy
    @card.destroy
    redirect_to cards_path, status: :see_other
  end

  private

  def set_cards
    @card = Card.find(params[:id])
  end

  def params_cards
    params.require(:card).permit(:content)
  end

end
