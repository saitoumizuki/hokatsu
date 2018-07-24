class CreateListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :list_items do |t|
    	t.integer :user_id, null: false
    	t.integer :nursery_id, null: false
    	t.integer :row_order
      t.timestamps
    end
  end
end
