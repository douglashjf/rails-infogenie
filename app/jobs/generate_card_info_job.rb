class GenerateCardInfoJob < ApplicationJob
  queue_as :default

  def perform(card)
    puts "Generate Summaries"
    generate_summaries(card)
    puts "Generate Categories"
    generate_categories(card)
    puts "Generate Generate Image"
    generate_image(card)
    puts "Generate Articles"
    generate_articles(card)
  end

  private

  def generate_summaries(card)
    # destructure primary and secondary keywords as variables
    # https://www.fullstackruby.dev/ruby-3-fundamentals/2021/01/06/everything-you-need-to-know-about-destructuring-in-ruby-3/
    (primary_keywords, secondary_keywords) = card.values_at(:primary_keywords, :secondary_keywords)

    # call the API with the params
    key_points = call_api(primary_keywords, secondary_keywords, "key points")
    key_questions = call_api(primary_keywords, secondary_keywords, "key questions")

    # save the results in a new instance of Summary
    summary = Summary.new(key_points:, key_questions:)
    summary.card = card
    summary.save!
  end

  def generate_categories(card)
    # Extract the selected categories from the API response
    selected_categories = call_api(card.primary_keywords, card.secondary_keywords, "selected categories")
    # Save the selected categories to the card
    card.categories = Category.where(tag: selected_categories)
    card.save!
  end

  def generate_image(card)
    image_url = generate_image_url(card.primary_keywords, card.secondary_keywords)
    card.image_url = image_url
    card.save!
  end

  def generate_articles(card)
    news_articles = NewsArticle.fetch_articles(card.primary_keywords, card.secondary_keywords)
    card.news_articles = news_articles
    card.save!
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

  def call_api(primary_keywords, secondary_keywords, query)
    # construct the prompt
    prompt = "Can you explain #{primary_keywords}. Associated keywords include: #{secondary_keywords}. My desired output is a JSON of 3 arrays:
    (i) key_points: 3 bullet points summarising this entire primary keyword with the associated keywords,
    (ii) key_questions: 3 bullet points output of key questions and
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
end
