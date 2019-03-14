class StudentsAssignmentsController < ApplicationController

  def new
  end

  def show
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


  def update
    current_record = StudentsAssignment.find(params[:id])
    current_record.update(done: true)

    render file: '../views/students/show.html.erb'

  end

  def incomplete
    @students_assignments = StudentsAssignment.all.where(student_id: session[:user_id])

    if !@students_assignments.empty?
      @student = current_student
      @student_name = @students_assignments.first.student.name
      @inc = @students_assignments.where(done: false )
      respond_to do |f|
        f.html {render :incomplete}
        f.json {render json: @inc}
      end
      
    else

      render file: '../views/students/show.html.erb'

    end


  end

end
