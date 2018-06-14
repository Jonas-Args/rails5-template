class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :model, default:''
      t.string :coding, default:''
      t.integer :seats, default: 0
      t.integer :door, default: 0
      t.integer :luggage, default: 0
      t.string :transmission, default: 0
    end
    add_reference :cars, :owner, foreign_key: { to_table: :users }, null: false, on_delete: :cascade
    add_reference :cars, :driver, foreign_key: { to_table: :users }, null: false, on_delete: :cascade
  end
end
