class AddReferrencesToCars < ActiveRecord::Migration[5.1]
  def change
    rename_table :per_payments, :rates
    remove_column :cars, :per_payment_id
    remove_column :cars, :car_att_id
    remove_column :cars, :car_model_id


    add_reference :car_attributes, :car, foreign_key: true, on_delete: :cascade
    add_reference :car_models, :car, foreign_key: true, on_delete: :cascade
    add_reference :rates, :car, foreign_key: true, on_delete: :cascade
  end
end
