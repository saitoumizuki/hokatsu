class AddPhoneMiddleToNurseries < ActiveRecord::Migration[5.1]
  def change
    add_column :nurseries, :phone_middle, :string
  end
end
