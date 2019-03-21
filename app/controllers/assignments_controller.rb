require 'pry'
class AssignmentsController < ApplicationController
  # before_action :set_user, except: [:create]
  before_action :set_student, only: [:show]

  def index
    @assignments = Assignment.all
  end

  def new
    @assignment = Assignment.new
  end

  def create
    binding.pry
    @user = User.find(session[:user_id])
    binding.pry
    @assignment = Assignment.new(assignment_params)
    binding.pry
    @assignment.subject_id = params[:subject_id]

    if @assignment.save
      redirect_to user_subject_path(@user, @assignment.subject), notice: "Assignment added."
    else
      redirect_to  new_subject_assignment_path
    end
  end

  def update

  end

  def show
    @assignment = Assignment.find(params[:id])
    if session[:user_id]
      @student = Student.find(session[:user_id])
    end
    @user = @assignment.subject.user
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @assignment}
    end
  end



  private
  def assignment_params
    params.require(:assignment).permit(
      :subject_id,
      :assignment_type,
      :name,

      :notes
    )
  end

  def set_student
    @user = Student.find(session[:user_id])
  end

  def mark_done
    @assignment.update(done: true)
  end

end
