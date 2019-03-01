class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def authenticate
    redirect_to signin_path unless (user_signed_in? || student_signed_in?)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_student
    @current_student ||= Student.find_by(id: session[:user_id])
  end



  def user_signed_in?
    !!current_user
  end

  def student_signed_in?
    !!current_student
  end


end
