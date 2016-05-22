class User < ActiveRecord::Base
  has_many :posts
  has_many :pets
  has_many :comments
  has_many :images, as: :imageable

  has_secure_password
  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {in: 2..30}
  validates :first_name, presence: true, length: {in: 2..50 }, format: {with: /[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+/u}
  validates :last_name, presence: true, length: {in: 2..75 }, format: {with: /[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+/u}
  validates :email, presence: true, uniqueness: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
    message: "only allows valid email addresses" }, length: {maximum: 200}, uniqueness: {case_sensitive: false}
  validates :zip, presence: true, length: {in: 5..10}

end
