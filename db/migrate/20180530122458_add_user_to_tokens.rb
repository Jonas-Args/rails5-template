class AddUserToTokens < ActiveRecord::Migration[5.1]
  def change
     add_reference :tokens, :user, index: true, foreign_key: true, on_delete: :cascade
  end
end
