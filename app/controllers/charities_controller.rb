class CharitiesController < ApplicationController

  def new
    @charity = Charity.new
  end

  def create
    @charity = Charity.new(charity_params)
    if @charity.save
      redirect_to charity_path(@charity)
    else
      @error = "There was a problem entering in your information, please try again."
      render :new
    end
  end

  def show
    @charity = Charity.find(params[:id])
    @wishlist = @charity.wishlists.first
    @wishlist.update_wishlist if @wishlist
  end

  def star
    @charity = Charity.find_by(params[:id])
    if current_user.charities.include?(@charity)
      users_charity = UsersCharity.find_by user:current_user, charity: @charity
      users_charity.destroy
    else
      current_user.charities << @charity
    end
    redirect_to charity_path(@charity)
  end

  private

  def charity_params
    params.require(:charity).permit(:name, :description, :zip_code, :contact_name, :contact_email, :contact_phone, :password_hash)
  end

end

 