class AddColumnToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :clock_id, :integer
  end
end
