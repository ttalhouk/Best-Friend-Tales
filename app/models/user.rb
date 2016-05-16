class User < ActiveRecord::Base
  has_many :posts
  has_many :pets
  has_many :comments
  has_many :images, as: :imageable

  has_secure_password
  validates :username, presence: true, uniqueness: true, length: {in: 2..20}
  validates :first_name, presence: true, length: {in: 2..50 }
  validates :last_name, presence: true, length: {in: 2..75 }

end
