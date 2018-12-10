class RemoveColumnsFromAssignments < ActiveRecord::Migration[5.2]
  def change
    remove_column :assignments, :grade
    remove_column :assignments, :user_id
  end
end
