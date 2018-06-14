class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :comment, null: false
      t.integer :star, null:false
    end
    add_reference :reviews, :commenter, foreign_key: { to_table: :users }, null: false, on_delete: :cascade
  end
end
