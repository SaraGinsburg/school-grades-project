class WorksController < ApplicationController
  def new
    @work = Work.create(
      user_id: params[:user_id],
      subject_id: params[:subject_id]
    )

    redirect_to user_path(@work.user)
  end

  def index
    @works = Work.all
  end
end
