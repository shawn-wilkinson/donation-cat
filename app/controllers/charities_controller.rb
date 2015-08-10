class CharitiesController < ApplicationController

  def show
    @charity = Charity.find(params[:id])
    @wishlist = @charity.wishlists.first
    @wishlist.update_wishlist
    current_user.visit_charity(@charity)
  end

  def star
    @charity = Charity.find(params[:id])
    if current_user.charities.include?(@charity)
      users_charity = UsersCharity.find_by user:current_user, charity: @charity
      users_charity.destroy
    else
      current_user.charities << @charity
      current_user.save
    end
    redirect_to charity_path(@charity)
  end

  def recently_visited

  end

end
