class Assignment < ApplicationRecord

  belongs_to :subject

  validates :name, presence: true,  length: { maximum: 40 }
  validates :assignment_type, presence: true


  has_many :students_assignments
  has_many :students, through: :students_assignments


  def weight
    if self.assignment_type = "HW"
      self.subject.hw_weight
    elsif self.assignment_type = "Quiz"
      self.subject.quiz_weight
    elsif self.assignment_type = "Test"
      self.subject.test_weight
    else
      self.subject.project_weight
    end
  end
end
