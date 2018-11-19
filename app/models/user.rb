class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :password, presence: true

  has_many :subjects
  has_many :assignments, through: :subjects
  has_many :students, through: :subjects

end
