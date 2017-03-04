class CreateGroupStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :group_students, {id: false} do |t|
    	t.references :group
    	t.references :student
    	
      t.timestamps
    end
    add_index :group_students, [:group_id, :student_id], unique: true
  end
end
