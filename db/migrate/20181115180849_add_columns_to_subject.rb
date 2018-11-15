class AddColumnsToSubject < ActiveRecord::Migration[5.2]
  def change

    add_column :subjects, :hw_weight, :integer
    add_column :subjects, :quiz_weight, :integer
    add_column :subjects, :test_weight, :integer
    add_column :subjects, :project_weight, :integer


  end
end
