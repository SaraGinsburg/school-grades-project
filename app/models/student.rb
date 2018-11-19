class Student < ApplicationRecord
  has_secure_password

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :password, presence: true

  has_many :subjects
  has_many :assignments, through: :subjects
  has_many :users, through: :subjects

  belongs_to: subject
end
