class CheckedTasks < ActiveRecord::Migration[5.1]
  def change
  	drop_table :checked_tasks
  end
end
