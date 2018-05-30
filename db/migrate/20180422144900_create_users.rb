class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :encrypted_password
      t.boolean :is_active, default: true
      t.boolean :is_locked, default: true
      t.timestamps
    end
  end
end
