class User < ActiveRecord::Base
  has_many :users_charities
  has_many :charities, through: :users_charities
  has_many :interests
  has_many :categories, through: :interests
  has_many :users_items
  has_many :items, through: :users_items



  has_secure_password



  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end



end
