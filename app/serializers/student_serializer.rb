class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :citizenship_grade
  has_many :assignments
  
  has_many :subjects

end
