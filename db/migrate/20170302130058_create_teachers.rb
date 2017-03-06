class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
    	t.references :user, foreign_key: true
    	t.string :group
    	t.string :teaching_courses


      t.timestamps
    end
  end
end
