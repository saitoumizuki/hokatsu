class RenameUserIdColumnToCheckedTasks < ActiveRecord::Migration[5.1]
  def change
  	rename_column :checked_tasks, :user_id, :task_id
  end
end
