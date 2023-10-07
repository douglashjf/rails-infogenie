require 'json'

class CardsController < ApplicationController
  before_action :set_cards, only: %i[show toggle_favourites destroy refresh_articles]

  def index

    @search_keyword = params[:query]
    @categories = current_user.categories if user_signed_in? && current_user.categories.present?

    if params[:query].present?
      base_query = Card.active.search_by_keyword(params[:query])



    else
      base_query = Card.active
    end

    @cards_by_category = {}

    if @categories.present?
      @categories.each do |category|
        cards_for_category = base_query.joins(:categories).where(categories: { id: category.id })
        @cards_by_category[category] = cards_for_category
      end

    else
      @cards_by_category_all = base_query
    end
  end

  def show
    @articles = @card.news_articles.uniq.slice(@card.news_articles.length - 3, @card.news_articles.length)
  end

  def new
    @card = Card.new

    # for modal use in future
    # respond_to do |format|
    #   format.html
    #   format.text { render "cards/new", :layout => false, formats: [:html] }
    # end
  end

  def create
    # create the card with the params
    @card = Card.new(params_cards)
    @card.user = current_user

    # validation for card.save
    if @card.save
      GenerateCardInfoJob.perform_later(@card)
      # redirect_to card_path(@card)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def refresh_articles
    news_articles = NewsArticle.fetch_articles(@card.primary_keywords, @card.secondary_keywords)

    @card.news_articles << news_articles
    @articles = @card.news_articles.uniq.slice(@card.news_articles.length - 3, @card.news_articles.length)

    respond_to do |format|
      format.html
      format.text { render partial: "refresh", locals: { articles: @articles }, formats: [:html] }
    end
  end

  def favorite_count
    @favorites.count
  end

  def toggle_favourites
    if current_user.favourites.exists?(card: @card)
      current_user.favourites.where(card: @card).destroy_all
    else
      Favourite.create(user: current_user, card: @card)
    end
  end

  def destroy
    @card.deleted_at = DateTime.now
    @card.save

    redirect_to cards_path
  end

  private

  def set_cards
    @card = Card.find(params[:id])
  end

  def params_cards
    params.require(:card).permit(:primary_keywords, :secondary_keywords, :image_url)
  end
end
