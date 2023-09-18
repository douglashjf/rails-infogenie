class Summary < ApplicationRecord
  belongs_to :card

  def self.generate_summary(card)

    # Retrieve the primary and secondary keywords from the submitted form
    primary_keywords = card.primary_keywords
    secondary_keywords = card.secondary_keywords

    openai_service = OpenaiService.new("#{primary_keywords} #{secondary_keywords}")
    @response = openai_service.call

  end
end
