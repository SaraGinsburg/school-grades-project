
class SessionsController < ApplicationController
  def new

    @student = Student.new
    @students = Student.all
    @user = User.new
    @users = User.all
  end

  def create

    if params.has_key? "student"
      @student = Student.find_by(name: params[:student][:name])
      return head(:forbidden) unless @student.authenticate(params[:student][:password])
      session[:user_id] = @student.id
      redirect_to me_student_path
    else
      if params.has_key? "user"
        @user = User.find_by(name: params[:user][:name])
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to me_user_path
      else
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.name = auth['info']['name']
          u.first_name = auth['info']['first_name']
          u.last_name = auth['info']['last_name']
          u.email = auth['info']['email']
          u.image = auth['info']['image']
          u.password = SecureRandom.hex
        end
        session[:user_id] = @user.id
        redirect_to me_user_path
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end
