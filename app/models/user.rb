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

  # geocoded_by :ipaddress, latitude: :lat, longitude: :lon
  # after_validation :geocode

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

  def recommended_charity
    if self.charities.length > 1
      match_weights = User.establish_match_weights(self.id)
      charity_scores = self.set_charity_scores(match_weights)
      recommend_charity_id = key_with_highest_value(charity_scores)
      Charity.find(recommend_charity_id)
    else
      Charity.all.sample
    end
  end

  def self.establish_match_weights(user_id)
    user = User.find(user_id)
    common_likes = UsersCharity.where(charity_id: user.charity_ids).pluck(:user_id, :charity_id)
    overlap_per_user = common_likes.group_by{ |user_id, charity_id| user_id }.map { |k, v| [k, v.length] }
  end

  def set_charity_scores(user_weights)
    charity_scores = {}
    Charity.all.each{|charity| charity_scores[charity.id] = 0}
    user_weights.each do |user_id, user_value|
      User.find(user_id).charities.each do |charity|
        charity_scores[charity.id] += user_value unless self.charities.include?(charity)
      end
    end
    return charity_scores
  end

  def key_with_highest_value(hash)
    hash.max_by{|k,v| v}[0]
  end

end
