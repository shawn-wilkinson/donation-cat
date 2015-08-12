class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(slug: params[:id])
    @charities = @category.charities
  end

  def interest
    @category = Category.find_by(slug: params[:id])
    if current_user.categories.include?(@category)
      interest = Interest.find_by user:current_user, category: @category
      interest.destroy
    else
      current_user.categories << @category
      current_user.save
    end
    p @category.name
    p "TACCCCCOOOOOO"
    redirect_to category_path(@category)
  end


end
