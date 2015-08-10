class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(slug: params[:id])
    @charities = @category.charities
  end
end
