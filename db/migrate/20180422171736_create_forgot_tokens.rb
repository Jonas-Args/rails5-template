class CreateForgotTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :forgot_tokens do |t|
      t.string :token
      t.datetime :expired_at

      t.timestamps
    end
    add_reference :forgot_tokens, :user, index: true, foreign_key: true, null: false, on_delete: :cascade
  end
end
