
class SubjectsController < ApplicationController
  before_action :find_subject, only: [:show, :edit, :update, :destroy]

  def index
    if User.where(id: params[:user_id]).exists?
      @user = User.find(params[:user_id])
      @subjects = Subject.all.where(user_id: @user.id)
      byebug
      
      respond_to do |f|
        f.html {render :index}
        f.json {render json: @subjects}
      end
    elsif Student.where(id: params[:student_id]).exists?
      @student = Student.find(params[:student_id])
      respond_to do |f|
        f.html {render :index}
        f.json {render json: @subjects}
      end
    else
      redirect_to root_path
    end
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
    params.require(:subject).permit(:name, :description, :user_id)
  end

  def find_subject
      @subject = Subject.find(params[:id])
  end
end
