class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :charities, through: :categorizations
  has_many :interests
  has_many :users, through: :interests
end
