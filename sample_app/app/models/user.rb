class User < ActiveRecord::Base
  before_save { email.downcase! }
  validates :name, presence: true, length: {maximum:50}
  validates :email, presence: true, 
                    length: {maximum:256}, 
                    format: {with:/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i},
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: {maximum: 6}
end
