class AddFirstNameAndLastNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string, default: nil
    add_column :users, :last_name, :string, default: nil
    rename_column :users, :username, :user_name
  end
end
