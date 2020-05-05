class CreatePosts < ActiveRecord::Migration[5.2]
  def up
    create_table :posts do |t|
      t.integer :user_id, foreign_key: true
      t.string  :title, null: false
      t.string  :material
      t.string  :tag
      t.text    :content, null: false

      t.timestamps
    end
    add_index :posts, [:user_id, :created_at]
  end

  def down
    drop_table :posts
  end
end
