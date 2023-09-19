  require 'json'

  class CardsController < ApplicationController
    before_action :set_cards, only: %i[show toggle_favourites destroy]

    def index
      @cards = Card.active
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
      # validation for card.save
      if @card.save
        # call the API with the params
        prompt = "Can you explain #{@card.primary_keywords}. Associated keywords include: #{@card.secondary_keywords}. My desired output is 2 bullet points summarising this entire primary keyword with the associated keyword and 2 bullet points output of key questions. Give me the response in json format of Ruby Arrays. 1st array will be 2 bullet points of the key_points and 2nd array will be 2 bullet points output of key_questions. Output should also be within 100 max_tokens " #edit this prompt to refine results
        response = OpenaiService.new(prompt).call
        # API will return results
        # key_points = response
        # key_questions = response

        parsed_response = JSON.parse(response)
        key_points = parsed_response["key_points"]
        key_questions = parsed_response["key_questions"]


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
  end
