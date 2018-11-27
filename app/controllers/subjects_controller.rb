class SubjectsController < ApplicationController
  before_action :find_subject, only: [:show, :edit, :update, :destroy]
  def index
    @user = current_user
    @subjects = Subject.all.where(user_id: @user.id)
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

# create_table "subjects", force: :cascade do |t|
#   t.string "name"
#   t.text "description"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.integer "hw_weight"
#   t.integer "quiz_weight"
#   t.integer "test_weight"
#   t.integer "project_weight"
#   t.integer "user_id"
# end
