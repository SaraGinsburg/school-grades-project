class User < ApplicationRecord
  has_secure_password

  scope :administrator, -> { where(admin: true)}

  validates :email, uniqueness: true,  presence: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :password, presence: true

  has_many :subjects
  has_many :assignments, through: :subjects
  has_many :students, through: :subjects

end
