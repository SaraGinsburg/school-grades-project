class CreateJoinTableSubjectsStudents < ActiveRecord::Migration[5.2]
  def change
    create_join_table :subjects, :students do |t|
      # t.index [:subject_id, :student_id]
      # t.index [:student_id, :subject_id]
    end
  end
end
