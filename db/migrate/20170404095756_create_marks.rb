class CreateMarks < ActiveRecord::Migration[5.0]
  def change
    create_table :marks do |t|
    	t.integer :grade
    	t.date :date
    	t.references :student
    	t.references :subject


      t.timestamps
    end
  end
end
