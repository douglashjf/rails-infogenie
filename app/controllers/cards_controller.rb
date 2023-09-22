require 'json'

class CardsController < ApplicationController
  before_action :set_cards, only: %i[show toggle_favourites destroy]

  def index
    if user_signed_in? && current_user.categories.present?
      @cards = Card.active.joins(:categories).where(categories: { id: current_user.categories.pluck(:id) })
    else
      @cards = Card.active
    end


    # if params[:query].present?
    #   sql_subquery = <<~SQL
    #     cards.user_id IN (SELECT users.id FROM users WHERE users.first_name @@ :query)
    #     OR cards.primary_keywords @@ :query
    #     OR cards.secondary_keywords @@ :query
    #     OR EXISTS (
    #       SELECT 1
    #       FROM unnest(cards.categories) AS category
    #       WHERE category @@ :query
    #     )
    #   SQL

    #   @cards = @cards.joins(:user).where(sql_subquery, query: "%#{params[:query]}%")
    # end

    # @cards = @cards.any? ? @cards : Card.active
  end

  def show
  end

  def new
    @card = Card.new
  end

  def create
    # create the card with the params
    @card = Card.new(params_cards)
    @card.user = current_user
    # define primary and secondary keywords as variables
    primary_keywords = @card.primary_keywords
    secondary_keywords = @card.secondary_keywords
    # validation for card.save
    if @card.save
      # call the API with the params
      key_points = call_api(primary_keywords, secondary_keywords, "key points")
      key_questions = call_api(primary_keywords, secondary_keywords, "key questions")
      # Extract the selected categories from the API response
      selected_categories = call_api(primary_keywords, secondary_keywords, "selected categories")
      # Save the selected categories to the card
      # @card.update(categories: selected_categories)
      @card.categories = Category.where(tag: selected_categories)


      # save the results in a new instance of Summary
      summary = Summary.new(key_points:, key_questions:)
      summary.card = @card
      summary.save!
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
    params.require(:card).permit(:primary_keywords, :secondary_keywords)
  end

  def call_api(primary_keywords, secondary_keywords, query)
    # construct the prompt
    prompt = "Can you explain #{primary_keywords}. Associated keywords include: #{secondary_keywords}. My desired output is a JSON of 3 arrays: (i) key_points: 2 bullet points summarising this entire primary keyword with the associated keywords, (ii) key_questions: 2 bullet points output of key questions and (iii) selected categories: which are selected by you from the following list: #{Card::CATEGORIES.join(', ')}. Return these to me in 1 JSON of 3 Ruby arrays so open and close it with { }. Output should also be within 1000 max_tokens. "  #edit this prompt to refine results

    # Call the API with the params
    response = OpenaiService.new(prompt).call
    # API will return results

    parsed_response = JSON.parse(response)
    return parsed_response["key_points"] if query == "key points"
    return parsed_response["key_questions"] if query == "key questions"
    return parsed_response["selected_categories"] if query == "selected categories"
  end
end
