class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :hw_weight, :quiz_weight, :test_weight, :project_weight
  belongs_to :user

  has_many :assignments
  has_many :students

end
