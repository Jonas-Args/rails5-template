class AddCarModelsToCars < ActiveRecord::Migration[5.1]
  def up
    add_reference :cars, :car_model, index: true, foreign_key: true, null: false, on_delete: :cascade
    remove_column :cars, :model
  end

  def down
    add_column :cars, :model, :string, default: ""
    remove_column :cars, :car_model_id
  end
end
