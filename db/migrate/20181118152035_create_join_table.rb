class CreateJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects_students, :id => false do |t|
      t.integer :subject_id
      t.integer :student_id
    end
  end
end
