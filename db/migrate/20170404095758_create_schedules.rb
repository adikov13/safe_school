class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
    	t.integer :priority
    	t.references :subject
    	t.references :group
      t.timestamps
    end
  end
end
