class ChangeDatatypeCategoryOfNurseries < ActiveRecord::Migration[5.1]
  def change
  	change_column :nurseries, :category, :string
  end
end
