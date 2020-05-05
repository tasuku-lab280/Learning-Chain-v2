class CreateLikes < ActiveRecord::Migration[5.2]
  def up
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false

      t.timestamps
    end
    add_index :likes, [:user_id, :post_id], unique: true
  end

  def down
    drop_table :likes
  end
end
