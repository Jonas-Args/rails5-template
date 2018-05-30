class RenameAccessTokenToToken < ActiveRecord::Migration[5.1]
  def change
    rename_table :access_tokens, :tokens
  end
end
