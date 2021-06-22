class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :first_body, null: false
      t.string :middle_body, null: false
      t.string :last_body, null: false
      t.string :url
      t.integer :user_id, null: false
      t.integer :theme_id, null: false

      t.timestamps
    end
  end
end
