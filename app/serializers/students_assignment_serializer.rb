class StudentsAssignmentSerializer < ActiveModel::Serializer
  attributes :id, :student_id, :assignment_id

  belongs_to :student
  belongs_to :assignment
end
