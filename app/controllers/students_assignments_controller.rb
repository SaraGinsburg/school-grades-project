class StudentsAssignmentsController < ApplicationController

def new
end

  def create
    @student = Student.find(session[:user_id])
    @student_assignment = StudentsAssignment.new
    @student_assignment.student_id = @student.id
    @student_assignment.assignment_id = params[:assignment_id]
    @student_assignment.done = true


    if @student_assignment.save
      flash[:notice] = "Assignment submitted."
    else
      flash[:notice] = "There was a problem submitting this assigment. Cannot be submitted more than once."
    end
    redirect_to  student_subjects_path(@student)
  end



end
