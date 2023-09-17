class SummariesController < ApplicationController
  def generate_summary
    card_id = params[:card_id]
    @card = Card.find(card_id)

    # Retrieve the primary and secondary keywords from the submitted form
    primary_keywords = params[:card][:primary_keywords]
    secondary_keywords = params[:card][:secondary_keywords]

    openai_service = OpenaiService.new("#{primary_keywords} #{secondary_keywords}")
    @response = openai_service.call

    # Store the response in the @card object or another appropriate variable
    @card.update(response: @response)

    # Redirect back to the card show page after generating the summary
    redirect_to card_path(@card)
  end
end
