class RemoveUserColumnsFromAccessToken < ActiveRecord::Migration[5.1]
  def up
    remove_column :access_tokens, :user_id
  end

  def down
    add_reference :access_tokens, :user, index: true, foreign_key: true, null: false, on_delete: :cascade
  end
end
