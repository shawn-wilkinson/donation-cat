class Category < ActiveRecord::Base
	

  has_many :categorizations
  has_many :charities, through: :categorizations
  has_many :interests
  has_many :users, through: :interests

  before_create :add_downcase_name
  after_create :set_slug

  def add_downcase_name
    self.downcase_name = name.downcase
  end

  def set_slug
    self.slug = self.name.downcase.split.join("-") + "-" + self.id.to_s
    self.save
  end

  def to_param
    self.slug
  end

end
