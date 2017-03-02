class CreateUserTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_types do |t|
    	t.string :user_type, null: false, default: ""

      t.timestamps
    end
  end
end
