class CreateSpots < ActiveRecord::Migration[5.1]
  def change
    create_table :spots do |t|
    	t.integer :user_id, null: false
    	t.string :name, null: false
  		t.text :detail
  		t.string :post_code
  		t.string :address
  		t.float :latitude
  		t.float :longitude
  		t.timestamps
    end
    add_index :spots, [:name, :address]
  end
end
