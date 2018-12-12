class DropColumnFromStudentsSubject < ActiveRecord::Migration[5.2]

    def change
      remove_column :students_subjects, :citizenship_grade
    end
  
end
