class CreatePerPayments < ActiveRecord::Migration[5.1]
  def change
    create_table :per_payments do |t|
      t.string :per
      t.integer :price, default: 0
    end
    add_reference :cars, :per_payment, index: true, foreign_key: true, null: false, on_delete: :cascade
  end
end
