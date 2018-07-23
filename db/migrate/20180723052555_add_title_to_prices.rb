class AddTitleToPrices < ActiveRecord::Migration[5.1]
  def change
    add_column :prices, :title, :string
  end
end
