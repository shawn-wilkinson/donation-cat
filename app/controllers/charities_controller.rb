class CharitiesController < ApplicationController

  def show
    @charity = Charity.find_by(slug: params[:id])
    @wishlist = @charity.wishlists.first
    @wishlist.update_wishlist
    if current_user.class == User
      current_user.visit_charity(@charity)
    end
  end

  def star
    @charity = Charity.find_by(slug: params[:id])
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

  def map_location
    @charity = Charity.find_by(slug: params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @charity }
    end
  end

end
