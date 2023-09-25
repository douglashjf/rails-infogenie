if @comment.persisted?
  json.form render(partial: "cards/commentform", formats: :html, locals: {card: @card, comment: Comment.new})
  json.inserted_item render(partial: "cards/comment", formats: :html, locals: {comment: @comment})
else
  json.form render(partial: "cards/commentform", formats: :html, locals: {card: @card, comment: @comment})
end
