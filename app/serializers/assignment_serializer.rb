class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :subject_id,  :assignment_type, :name, :notes

  belongs_to :subject

  has_many :students_assignments
  has_many :students, through: :students_assignments
end
