class CardChannel < ApplicationCable::Channel
  def subscribed
    card = Card.find(params[:id])
    stream_for card
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
