class ChangeColumnInSchedule < ActiveRecord::Migration[5.0]
  def change
  	change_column :schedules, :day_of_week, :integer
  end
end
