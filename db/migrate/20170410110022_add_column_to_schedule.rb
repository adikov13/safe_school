class AddColumnToSchedule < ActiveRecord::Migration[5.0]
  def change
  	add_column :schedules, :day_of_week, :string
  end
end
