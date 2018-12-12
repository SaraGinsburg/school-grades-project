class StudentsSubject < ApplicationRecord
  belongs_to :student
  belongs_to :subject

  scope :excellent, -> {where('citizenship_grade > ?', 89)}
end
