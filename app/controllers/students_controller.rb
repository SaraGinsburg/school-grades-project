class StudentsController < ApplicationController
  before_action :authenticate

  def show
    @student = Student.find(params[:id])
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @student}
    end
  end

  def index
    @user = current_user
    @subjects = @user.subjects
    respond_to do |f|
      f.html {render :index}
      f.json {render json: @subjects}
    end
  end

  def excelling
    @user =  User.find(session[:user_id])
    @excelling_students = @user.students.excellent_citizenship.uniq
    render file: '../views/students/excelling_students.html.erb'

  end
end
