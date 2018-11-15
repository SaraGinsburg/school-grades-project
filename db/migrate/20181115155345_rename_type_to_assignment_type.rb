class RenameTypeToAssignmentType < ActiveRecord::Migration[5.2]
  def change
    rename_column :assignments, :type, :assignment_type
  end
end
