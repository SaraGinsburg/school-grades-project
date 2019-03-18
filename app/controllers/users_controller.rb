class UsersController < ApplicationController
  before_action :authenticate
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.update(name: @user.first_name + " " + @user.last_name)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Successfully created new user"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @current_user.update(user_params)
      redirect_to user_path(@current_user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :admin, :password)
  end



  def find_user
    @current_user ||= User.find(params[:id])
  end
end
