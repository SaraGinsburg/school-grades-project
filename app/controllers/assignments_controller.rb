require 'pry'
class AssignmentsController < ApplicationController
  before_action :set_user, except: [:create]

  def index
    @assignments = Assignment.all
  end

  def new
    @assignment = Assignment.new
  end

  def create

    @user = User.find(session[:user_id])
    @assignment = Assignment.new(assignment_params)
    @assignment.user_id = session[:user_id]
    @assignment.subject_id = params[:subject_id]

    if @assignment.save
      redirect_to user_subject_path(@user, @assignment.subject), notice: "Assignment added."
    else
      redirect_to  new_subject_assignment_path
    end
  end

  def show

    @assignment = Assignment.find(params[:id])
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = @assignment.subject.user
    end
  end

  private
  def assignment_params
    params.require(:assignment).permit(
      :subject_id,
      :user_id,
      :assignment_type,
      :name,
      :grade,
      :notes
    )
  end

  def set_user
    @user = User.find(session[:user_id])
  end


end
