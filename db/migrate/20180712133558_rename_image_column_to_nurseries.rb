class RenameImageColumnToNurseries < ActiveRecord::Migration[5.1]
  def change
  	rename_column :nurseries, :image, :image_id
  end
end
