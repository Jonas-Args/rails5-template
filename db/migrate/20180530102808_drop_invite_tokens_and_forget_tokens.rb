class DropInviteTokensAndForgetTokens < ActiveRecord::Migration[5.1]
  def up
    drop_table :invite_tokens do |t|
      t.string :token
      t.datetime :expired_at
    end
    drop_table :forgot_tokens do |t|
      t.string :token
      t.datetime :expired_at
    end
  end

  def down
    create_table :invite_tokens do |t|
      t.string :token
      t.datetime :expired_at
    end
    create_table :forgot_tokens do |t|
      t.string :token
      t.datetime :expired_at
    end
    add_reference :invite_tokens, :user, index: true, foreign_key: true, null: false, on_delete: :cascade
    add_reference :forgot_tokens, :user, index: true, foreign_key: true, null: false, on_delete: :cascade
  end
end
