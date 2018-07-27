class CreateListMemos < ActiveRecord::Migration[5.1]
  def change
    create_table :list_memos do |t|
    	t.integer :list_item_id, null: false
    	t.text :body
      t.timestamps
    end
  end
end
