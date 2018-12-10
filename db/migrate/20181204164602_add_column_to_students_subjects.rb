class AddColumnToStudentsSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :students_subjects, :citizenship_grade, :integer
  end
end
