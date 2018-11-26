class StudentsController < ApplicationController
  def index
    @user = current_user
    @subjects = @user.subjects
  end


end
