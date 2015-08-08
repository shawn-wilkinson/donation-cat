class Wishlist < ActiveRecord::Base
  belongs_to :charity
  has_many :items

end
