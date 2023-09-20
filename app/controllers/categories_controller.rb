class CategoriesController < ApplicationController
  def edit
    @categories = Category.all
  end

  def update
    current_user.categories = Category.where(id: params[:user][:category_ids])
    redirect_to cards_path
  end
end
