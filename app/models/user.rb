class User < ActiveRecord::Base
  has_many :users_charities
  has_many :charities, through: :users_charities
  has_many :interests
  has_many :categories, through: :interests
  has_many :users_items
  has_many :items, through: :users_items
end
