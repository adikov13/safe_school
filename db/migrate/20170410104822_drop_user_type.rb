class DropUserType < ActiveRecord::Migration[5.0]
  def change
  	drop_table :user_types
  end
end
