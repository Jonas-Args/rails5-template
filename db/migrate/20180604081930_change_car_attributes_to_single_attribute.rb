class ChangeCarAttributesToSingleAttribute < ActiveRecord::Migration[5.1]
  def change
    remove_column :cars, :coding
    remove_column :cars, :seats
    remove_column :cars, :door
    remove_column :cars, :luggage
    remove_column :cars, :transmission

    create_table :car_atts do |t|
      t.string :name
      t.string :value
      t.timestamps
    end
      add_reference :cars, :car_att, foreign_key: true, on_delete: :cascade
  end
end
