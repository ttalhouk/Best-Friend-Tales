class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :images, as: :imageable

  validates :name, presence: true
  validates :animal, presence: true
  validates :sex, presence: true

end
