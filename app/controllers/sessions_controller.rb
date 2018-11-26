
class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.first_name = auth['info']['first_name']
      u.last_name = auth['info']['last_name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      u.password = SecureRandom.hex
    end


    session[:user_id] = @user.id
    redirect_to me_path
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
