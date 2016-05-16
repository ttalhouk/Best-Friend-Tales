class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  validates :name, presence: true, length: {in: 2..1500}
end
