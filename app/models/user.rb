class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :password, presence: true

  has_many :assignments
  has_many :subjects, through: :assignments

end
