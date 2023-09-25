class CommentsController < ApplicationController
  def create
    # 1) find the card
    @card = Card.find(params[:card_id])
    # 2) define create comment
    @comment = Comment.new(comment_params)
    # 3) comment belongs to current user who made the comment
    @comment.user = current_user
    # 4) link created comment with card that was commented on
    @comment.card = @card

    if @comment.save!
      redirect_to @card
    else
      render 'card/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
