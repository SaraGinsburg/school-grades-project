class CreateStudentsAssignmentsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :students_assignments do |t|
      t.integer :student_id
      t.integer :assignment_id
      t.integer :grade
      t.boolean :done

      t.timestamps
    end
  end
end
