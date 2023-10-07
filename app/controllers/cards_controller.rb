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

      # generate image
      image_url = generate_image_url(primary_keywords, secondary_keywords)

      @card.image_url = image_url
      @card.save!

      news_articles = NewsArticle.fetch_articles(primary_keywords, secondary_keywords)
      @card.news_articles = news_articles


      redirect_to card_path(@card)
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

  def call_api(primary_keywords, secondary_keywords, query)
    # construct the prompt
    prompt = "Can you explain #{primary_keywords}. Associated keywords include: #{secondary_keywords}. My desired output is a JSON of 3 arrays:
    (i) key_points: 1 bullet points summarising this entire primary keyword with the associated keywords,
    (ii) key_questions: 1 bullet points output of key questions and
    (iii) selected categories: which are selected by you from the following list: #{Card::CATEGORIES.join(', ')}.
    Return these to me in 1 JSON of 3 Ruby arrays so open and close it with { }.
    Output should also be within 3000 max_tokens."# edit this prompt to refine results

    # Call the API with the params
    response = OpenaiService.new(prompt).call
    # API will return results

    parsed_response = JSON.parse(response)
    return parsed_response["key_points"] if query == "key points"
    return parsed_response["key_questions"] if query == "key questions"
    return parsed_response["selected_categories"] if query == "selected categories"
  end

  def generate_image_url(primary_keywords, secondary_keywords)
    # construct the prompt
    prompt = "Mondrian-style realistic painting of #{primary_keywords} with additional context of #{secondary_keywords}"

    # Call the API with the params
    image_url = OpenaiService.new(prompt).generate_dalle_image
    # Download and upload the image to Cloudinary, and retrieve the new URL.
    uploaded_image = Cloudinary::Uploader.upload(image_url)

    # Use the 'secure_url' attribute from the Cloudinary upload response as your image_url.
    cloudinary_url = uploaded_image['secure_url']

    # save URL as string in the card
    return cloudinary_url
  end
end
