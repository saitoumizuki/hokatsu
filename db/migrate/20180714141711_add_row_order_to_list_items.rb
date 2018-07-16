class AddRowOrderToListItems < ActiveRecord::Migration[5.1]
  def change
    add_column :list_items, :row_order, :integer
  end
end
