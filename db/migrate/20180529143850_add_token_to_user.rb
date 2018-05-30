class AddTokenToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :access_tokens, :tokenable_id, :integer
    add_column :access_tokens, :tokenable_type, :string

    add_index :access_tokens, [:tokenable_id, :tokenable_type]
  end
end
