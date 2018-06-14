class RemoveAddressFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :cars, :address
    remove_column :cars, :longitude
    remove_column :cars, :latitude
  end
end
