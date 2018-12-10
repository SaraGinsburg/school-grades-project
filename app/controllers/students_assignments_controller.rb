class StudentsAssignmentsController < ApplicationController

def new
end

  def create

    @student = Student.find(session[:user_id])
    student_assignment = StudentsAssignment.new
    student_assignment.student_id = @student.id
    student_assignment.assignment_id = params[:assignment_id]
    student_assignment.done = true
    student_assignment.save

  end



end
