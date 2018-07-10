class RenameTaskIdColumnToCheckedTasks < ActiveRecord::Migration[5.1]
  def change
  	rename_column :checked_tasks, :task_id, :user_id
  end
end
