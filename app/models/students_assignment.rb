class StudentsAssignment < ApplicationRecord
  belongs_to :student
  belongs_to :assignment

  validates_uniqueness_of :student_id, :scope => :assignment_id
end
