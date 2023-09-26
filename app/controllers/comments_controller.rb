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

    respond_to do |format|
      if @comment.save!
        format.html { redirect_to card_path(@card) }
        format.json
      else
        format.html { render 'card/show', status: :unprocessable_entity }
        format.json
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
