class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :images, as: :imageable

  validates :name, presence: true, length: {maximum: 50}
  validates :species, presence: true, length: {maximum: 30}
  validates :breed, presence: true, length: {maximum: 100}
  validates :age, numericality: {only_integer: true}

end
