class RenameTypeColumnToNurseries < ActiveRecord::Migration[5.1]
  def change
  	rename_column :nurseries, :type, :category
  end
end
