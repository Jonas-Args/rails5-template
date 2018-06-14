class AddUniqueIndexToRates < ActiveRecord::Migration[5.1]
  def change
    add_index :rates, [:per, :price, :car_id], unique: true
  end
end
