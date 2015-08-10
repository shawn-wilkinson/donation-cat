class User < ActiveRecord::Base

  validates :username, presence: true
  validates_uniqueness_of :email
  validates :email, presence: true




  has_many :users_charities
  has_many :charities, through: :users_charities
  has_many :interests
  has_many :categories, through: :interests
  has_many :users_items
  has_many :items, through: :users_items
  has_many :visitations
  has_many :visited_charities, through: :visitations, source: :charity

  after_create :set_slug

  has_secure_password


  def recently_visited_charities
    self.visited_charities.order('created_at DESC').uniq.limit(5)
  end

  def visit_charity(charity)
    self.visited_charities << charity
    self.save
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  def set_slug
    self.slug = self.username.downcase.split.join("-") + "-" + self.id.to_s
    self.save
  end

  def to_param
    self.slug
  end



end
