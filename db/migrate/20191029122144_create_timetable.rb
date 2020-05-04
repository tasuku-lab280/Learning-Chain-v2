class CreateTimetable < ActiveRecord::Migration[5.2]
  def up
    create_table :timetables do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :timetables
  end
end
