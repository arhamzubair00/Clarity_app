class AddCalendarDateToDays < ActiveRecord::Migration[6.1]
  def change
    add_column :days, :calendar_date, :date, null: false
  end
end
