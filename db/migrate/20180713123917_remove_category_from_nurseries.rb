class RemoveCategoryFromNurseries < ActiveRecord::Migration[5.1]
  def change
    remove_column :nurseries, :category, :string
  end
end
