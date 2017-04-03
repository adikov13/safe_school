class CreateParentStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :parent_students do |t|
    	t.references :parent
    	t.references :student
      t.timestamps
    end
  end
end
