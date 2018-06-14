class ChangeRefferenceCarModelToCars < ActiveRecord::Migration[5.1]
  def change
    remove_column :car_models, :car_id
    add_reference :cars, :car_model, foreign_key: true, on_delete: :cascade
  end
end
