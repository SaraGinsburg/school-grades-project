class Subject < ApplicationRecord
  belongs_to :user

  has_many :assignments

  has_many :students_subjects
  has_many :students, through: :students_subjects

end
