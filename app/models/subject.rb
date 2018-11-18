class Subject < ApplicationRecord
  has_many :assignments
  has_many :users, through: :assignments

  has_many :students
  belongs_to :student
end
