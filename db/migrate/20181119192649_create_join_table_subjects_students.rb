class CreateJoinTableSubjectsStudents < ActiveRecord::Migration[5.2]
  def change
    create_join_table :subjects, :students
    
  end
end
