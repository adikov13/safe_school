class CreateGroupStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :group_students do |t|
    	t.references :group
    	t.references :student
    	
      t.timestamps
    end
  end
end
