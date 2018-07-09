class CreateCheckedTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :checked_tasks do |t|
    	t.integer :user_id, null: false
      t.timestamps
    end
  end
end
