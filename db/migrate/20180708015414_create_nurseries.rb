class CreateNurseries < ActiveRecord::Migration[5.1]
  def change
    create_table :nurseries do |t|
    	t.integer :admin_id, null: false
    	t.string :name, null: false
      t.string :category
    	t.string :nearest
    	t.string :phone
    	t.string :email
    	t.text :capacity
  		t.text :date
  		t.text :time
  		t.text :holiday
  		t.text :url
      t.string :post_code
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
    add_index :nurseries, [:name, :category, :nearest, :address]
  end
end
