class AddAddressToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :address, :string, default: ''
    add_column :cars, :latitude, :float, default: 0.0
    add_column :cars, :longitude, :float, default: 0.0
  end
end
