class AddResetPasswordToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :reset_password_token, :string, default: nil
    add_column :users, :reset_password_token_sent_at, :datetime, default: Time.zone.now
  end
end
