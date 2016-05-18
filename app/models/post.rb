class Post < ActiveRecord::Base
  belongs_to :user
  has_many :images, as: :imageable
  has_many :comments

  validates :title, presence: true, length: {in: 3..75}
  validates :description, presence: true, length: {in: 5..150}
  validates :body, presence: true, length: {in: 100..5000}
end
