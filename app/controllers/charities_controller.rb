class CharitiesController < ApplicationController

  def show
    @charity = Charity.find(params[:id])
    @wishlist = @charity.wishlists.first
  end

end
