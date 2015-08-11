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
    match_weights = User.establish_match_weights(self.id)
    charity_scores = self.set_charity_scores(match_weights)
    recommend_charity_id = key_with_highest_value(charity_scores)
    Charity.find(recommend_charity_id)
  end

  def key_with_highest_value(hash)
    max_key = hash.max_by{|k,v| v}
    return max_key[0]
  end


  def self.establish_match_weights(user_id)
    selected_user = User.find(user_id)
    match_scores = []
    User.all.each do |user|
      match_num = 0
      user.charities.each do |charity|
        if selected_user.charities.include?(charity)
          match_num = match_num + 1
        end
      end
      match_scores << match_num
    end
    return match_scores
  end

  def set_charity_scores(weights)
    match_weights = weights
    charity_scores = {}
    Charity.all.each{|charity| charity_scores[charity.id] = 0}
    User.all.each_with_index do |user,index|
      if self.id != user.id
        user.charities.each do |charity|
          unless self.charities.include?(charity)
            charity_scores[charity.id] += match_weights[index]
          end
        end
      end
    end
    return charity_scores
  end


end
