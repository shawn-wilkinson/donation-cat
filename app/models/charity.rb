class Charity < ActiveRecord::Base
  has_many :users_charities
  has_many :users, through: :users_charities
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :wishlists
  has_many :items, through: :wishlists
  has_many :visitations
  has_many :visiting_users, through: :visitations, source: :user

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
