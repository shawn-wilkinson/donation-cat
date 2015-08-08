class Item < ActiveRecord::Base
  belongs_to :wishlist
  has_one :charity, through: :wishlist
  has_many  :users_items
  has_many :users, through: :users_items
end
