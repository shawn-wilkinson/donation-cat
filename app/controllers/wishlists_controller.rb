class WishlistsController < ApplicationController


	def index

	end

	def new
		@charity = Charity.find(params[:charity_id])
		@wishlist = @charity.wishlists.new
	end

	def create
		@charity = Charity.find(params[:charity_id])
		@wishlist = @charity.wishlists.new(wishlist_params)

		if @wishlist.save
			redirect_to "/charities/#{@charity.id}"
		else
		  @error = "There was a problem entering in your information, please try again."
    	render :new
    end

	end

	def show
		@charity = Charity.find(params[:charity_id])

	end

	private

	def wishlist_params
    params.require(:wishlist).permit(:original_link, :link)
  end
	
end
