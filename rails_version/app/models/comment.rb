class Comment < ActiveRecord::Base
  has_many :images, as: :imageable
  belongs_to :post
  belongs_to :user

  validates :body, presence: true, length: {in: 2..1000}
end
