class ChangeTokenModel < ActiveRecord::Migration[5.1]
  def up
    remove_column :tokens, :tokenable_id
    remove_column :tokens, :tokenable_type
    add_column :tokens, :type, :string
  end
  def down
    add_column :tokens, :tokenable_id, :integer
    add_column :tokens, :tokenable_type, :string
    add_index :access_tokens, [:tokenable_id, :tokenable_type]
  end
end
