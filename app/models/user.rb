class User < ApplicationRecord
  has_secure_password

  has_many :favourite_cities
  has_many :cities, through: :favourite_cities

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

end
