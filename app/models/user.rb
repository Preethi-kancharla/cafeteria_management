class User < ApplicationRecord
  has_secure_password
  has_many :orders
  validates :name, presence: true, length: { in: 3..50 }
  #validates :email, presence: true, uniqueness: true, email: true

end