class WishlistsController < ApplicationController


	def index

	end

	def new
		@charity = Charity.find_by(slug: params[:charity_id])
		@wishlist = @charity.wishlists.new
		respond_to do |format|
      format.html do
      	if request.xhr?
      		render :partial => "wishlists/new.html.erb", layout: false
      	else
      		render "wishlists/new"
      	end 
      end  
    end
	end

	def create
		@charity = Charity.find_by(slug: params[:charity_id])
		old_wishlist = @charity.wishlists.last
		old_wishlist.destroy if old_wishlist
		@wishlist = @charity.wishlists.new(wishlist_params)

		if @wishlist.save
			redirect_to "/charities/#{@charity.slug}"
		else
		  @error = "There was a problem entering in your information, please try again."
    	render :new
    end

	end

	def show
		@charity = Charity.find_by(slug: params[:charity_id])

	end

	private

	def wishlist_params
    params.require(:wishlist).permit(:original_link, :link)
  end
	
end
