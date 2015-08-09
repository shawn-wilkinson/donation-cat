class CharitiesController < ApplicationController

  def new
    @charity = Charity.new
  end


  #  def create
  #   @charity = Charity.new()


  #     session[:user_id] = @user.id
  #     redirect_to '/'
  #   else
  #     @error = "There was a problem entering in your information, please try again."
  #     render :new
  #   end
  # end


  def show
    @charity = Charity.find(params[:id])
    @wishlist = @charity.wishlists.first
    @wishlist.update_wishlist
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

end
# test_charity = Charity.create(name:"Lucky Dog Animal Rescue", description: "Lucky Dog Animal Rescue is a non-profit organization dedicated to rescuing homeless and abandoned animals, primarily dogs from high-kill shelters and owners who can no longer care for them. By working with committed volunteers, foster homes, local veterinarians, trainers, and boarding facilities, we are able to rescue hundreds of animals every year, provide them with loving temporary care, and find them well-matched, carefully screened forever homes. We also serve as a resource to our community and all pet owners by providing education and information on responsible pet ownership, including the importance of spay/neuter, positive behavior training, and good nutrition.", contact_name: Faker::Name.name, contact_email: Faker::Internet.email , password_hash:"password")

# test_category = Category.find_by(name: "Animal Advocacy")
# test_category.charities << test_charity

# test_charity.wishlists.create!(name: "Our Wishlist", link: "http://www.amazon.com/gp/registry/wishlist/ref=cm_wl_act_print_v?ie=UTF8&disableNav=1&filter=all&id=3AW1BUYSY69G5&items-per-page=200&layout=standard-print&sort=date-added&visitor-view=1", original_link: "http://www.amazon.com/gp/registry/wishlist/3AW1BUYSY69G5" )