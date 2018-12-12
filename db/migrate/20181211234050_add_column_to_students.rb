class AddColumnToStudents < ActiveRecord::Migration[5.2]
  def change

      add_column :students, :citizenship_grade, :integer
  end

end
