class Student < ApplicationRecord
  has_secure_password

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }


  has_many :assignments, through: :subjects
  has_many :users, through: :subjects

  has_many :students_subjects
  has_many :subjects, through: :students_subjects

  has_many :students_assignments
  has_many :assignments, through: :students_assignments

  scope :excellent_citizenship, -> { where('citizenship_grade > ?', 89)}


end
