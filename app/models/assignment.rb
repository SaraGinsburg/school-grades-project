class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :subject

  validates :name, presence: true, uniqueness: true, length: { maximum: 40 }
  validates :assignment_type, presence: true


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
