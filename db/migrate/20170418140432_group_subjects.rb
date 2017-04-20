class GroupSubjects < ActiveRecord::Migration[5.0]
  def change
  	create_table :group_subjects do |t|
    	t.references :group
    	t.references :subject
    	
      t.timestamps
    end
  end
end
