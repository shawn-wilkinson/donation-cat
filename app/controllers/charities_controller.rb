class CharitiesController < ApplicationController

  def new
    @charity = Charity.new
  end

  def identify
    @charity = Charity.new
  end

  def login
    @charity = Charity.find_by_contact_email(params[:contact_email])
    
    if @charity && @charity.authenticate(params[:password])
      session[:charity_id] = @charity.id
      session[:user_id] = nil
      redirect_to charity_path(@charity)
    else
      render :identify
      @error = "Invalid Login"
    end
  end

  def edit
    @charity = Charity.find_by(slug: params[:id])
    redirect_to '/' if current_user != @charity
  end

  def update
    @charity = Charity.find_by(slug: params[:id])
    if @charity.update(charity_params)
      redirect_to '/'
    else
      @errors = "There was a problem updating your information, please make sure all fields are entered."
      render :edit
    end

  end

  def destroy
    session[:charity_id] = nil
    redirect_to '/'
  end

  def create
    @charity = Charity.new(charity_params)
    if @charity.save
      session[:charity_id] = @charity.id
      session[:user_id] = nil
      redirect_to charity_path(@charity)
    else
      @error = "There was a problem entering in your information, please try again."
      render :new
    end
  end

  def profile
    @charity = Charity.find_by(slug: params[:id])
    redirect_to '/' if current_user != @charity
  end

  def show
    @charity = Charity.find_by(slug: params[:id])
    @wishlist = @charity.wishlists.last
    @wishlist.update_wishlist if @wishlist
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

  def map_locations
    @charities = Charity.all.select { |charity| charity.latitude != nil }
    respond_to do |format|
      format.html
      format.json { render json: @charities }
    end
  end

  private

  def charity_params
    params.require(:charity).permit(:name, :description, :category, :zip_code, :contact_name, :contact_email, :contact_phone, :street_address, :city, :state, :password, category_ids: [])
  end


end

 