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

  geocoded_by :address_string
  after_validation :geocode, :if => :address_string_changed?

  def add_downcase_name
    self.downcase_name = name.downcase
  end

  def address_string
    street_address + ", " + city + ", " + state + " " + zip_code
  end

  def address_string_changed?
    street_address_changed? || city_changed? || state_changed? || zip_code_changed?
  end

end
