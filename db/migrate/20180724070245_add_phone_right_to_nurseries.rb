class AddPhoneRightToNurseries < ActiveRecord::Migration[5.1]
  def change
    add_column :nurseries, :phone_right, :string
  end
end
