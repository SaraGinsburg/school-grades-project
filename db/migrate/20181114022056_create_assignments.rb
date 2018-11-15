class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.integer :subject_id
      t.integer :user_id
      t.string :type
      t.string :name
      t.text :notes

      t.timestamps
    end
  end
end
