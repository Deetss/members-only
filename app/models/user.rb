class User < ApplicationRecord
  has_secure_password
  has_many :posts
  validates :name, presence: true, length:{maximum: 12}
  validates :email, presence: true, length:{maximum: 50}, uniqueness: {case_sensitive: false}
  before_create :create_remember_token

  def remember
    self.create_remember_token
  end
  
  def create_remember_token
    random_token = SecureRandom.urlsafe_base64.to_s
    self.remember_token = Digest::SHA1.hexdigest(random_token)
  end
end
