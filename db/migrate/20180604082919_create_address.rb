class CreateAddress < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :address
      t.float :longitude
      t.float :latitude
      t.timestamps
    end
      add_reference :cars, :address, foreign_key: true, on_delete: :cascade
  end
end
