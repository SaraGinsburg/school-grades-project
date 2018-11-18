class AddGradeColumnToAssignment < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :grade, :integer
  end
end
