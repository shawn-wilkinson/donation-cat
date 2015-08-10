class Category < ActiveRecord::Base
	

  has_many :categorizations
  has_many :charities, through: :categorizations
  has_many :interests
  has_many :users, through: :interests

  before_create :add_downcase_name

  def add_downcase_name
    self.downcase_name = name.downcase
  end

end
