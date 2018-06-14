class RemoveOwnerFromUser < ActiveRecord::Migration[5.1]
  def up
    remove_column :cars, :owner_id
  end

  def down
    add_reference :cars, :owner, foreign_key: { to_table: :users }, null: false, on_delete: :cascade
  end
end
