class DropTimetable < ActiveRecord::Migration[5.2]
  def change
    def up
    drop_table :timetables
    end
    def down
      create_table :timetables do |t|
        t.string :name
        t.timestamps
      end
    end
  end
end
