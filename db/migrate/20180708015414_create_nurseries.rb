class CreateNurseries < ActiveRecord::Migration[5.1]
  def change
    create_table :nurseries do |t|
    	t.integer :admin_id, null: false
    	t.string :name, null: false
    	t.integer :type, null: false, default: 0
    	t.string :nearest
    	t.string :phone
    	t.string :email
    	t.text :capacity
  		t.text :date
  		t.text :time
  		t.text :holiday
  		t.text :url
  		t.text :image
  		t.text :concept
  		t.text :concept_detail
      t.string :post_code
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
    add_index :nurseries, [:name, :type, :nearest, :address]
  end
end
