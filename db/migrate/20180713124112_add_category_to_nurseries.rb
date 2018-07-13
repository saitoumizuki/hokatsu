class AddCategoryToNurseries < ActiveRecord::Migration[5.1]
  def change
    add_column :nurseries, :category, :string
  end
end
