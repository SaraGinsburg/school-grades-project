class StudentsController < ApplicationController
  def index
    @user = current_user
    @subjects = @user.subjects
  end

  def excelling
    @user =  User.find(session[:user_id])
    @excelling_students = @user.students.excellent_citizenship.uniq
    render file: '../views/students/excelling_students.html.erb'

  end
end
