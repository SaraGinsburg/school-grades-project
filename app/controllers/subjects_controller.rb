class SubjectsController < ApplicationController
  before_action :find_subject, only: [:show, :edit, :update, :destroy]
  def index
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to subject_path(@subject), notice: "Successfully created new Subject"
    else
      render 'new'
    end
  end

  def show
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :description)
  end

  def find_subject
      @subject = Subject.find(params[:id])
  end
end
