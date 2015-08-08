class Charity < ActiveRecord::Base
  has_many :users_charities
  has_many :users, through: :users_charities
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :wishlists
  has_many :items, through: :wishlists

	
end
