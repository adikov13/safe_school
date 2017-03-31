class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
    	t.references :parent
    	t.references :teacher

      t.timestamps
    end
    add_index :conversations, [:teacher_id, :parent_id], unique: true
  end
end
