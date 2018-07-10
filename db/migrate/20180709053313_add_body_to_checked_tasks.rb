class AddBodyToCheckedTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :checked_tasks, :body, :text
  end
end
