class Charity < ActiveRecord::Base


  # validates_presence_of :contact_email, presence: true
  validates_presence_of :password_digest, presence: true


  has_many :users, through: :users_charities
  has_many :users_charities
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :wishlists
  has_many :items, through: :wishlists
  has_many :visitations
  has_many :visiting_users, through: :visitations, source: :user

  before_create :add_downcase_name
  after_create :set_slug

  geocoded_by :address_string
  after_validation :geocode, :if => :address_string_changed?

  has_secure_password


  def add_downcase_name
    self.downcase_name = name.downcase
  end

  def address_string
    street_address + ", " + city + ", " + state + " " + zip_code
  end

  def address_string_changed?
    street_address_changed? || city_changed? || state_changed? || zip_code_changed?
  end

  def set_slug
    self.slug = self.name.downcase.split.join("-") + "-" + self.id.to_s
    self.save
  end

  def to_param
    self.slug
  end

end



