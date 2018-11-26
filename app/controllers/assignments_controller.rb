require 'pry'
class AssignmentsController < ApplicationController
  before_action :set_user, except: [:create]

  def index
    @assignments = Assignment.all
  end

  def new
    @assignment = Assignment.new(
      user_id: session[:user_id]
    )
  end

  def create
    @user = User.find(session[:user_id])
    @assignment = Assignment.new(assignment_params)
    @assignment.user_id = session[:user_id]
    if @assignment.save
      redirect_to user_assignment_path(@user, @assignment), notice: "Assignment added."
    else
      render :new
    end
  end

  def show
    @assignment = Assignment.find(params[:id])
    @user = User.find(params[:user_id])
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
