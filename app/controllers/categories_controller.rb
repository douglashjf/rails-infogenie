class CategoriesController < ApplicationController
  def edit
    @categories = Category.all
  end

  def update
    unselected_categories = Category.where(id: params[:user][:category_ids])
    current_user.categories = Category.all - unselected_categories
    redirect_to cards_path, notice: 'Preference saved successfully.'

  end
end
