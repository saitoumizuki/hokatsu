class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
    	t.integer :nursery_id, null: false
    	t.integer :zero
    	t.integer :one
    	t.integer :twe
    	t.integer :three
    	t.integer :four
    	t.integer :five
      t.string :title
      t.timestamps
    end
  end
end
