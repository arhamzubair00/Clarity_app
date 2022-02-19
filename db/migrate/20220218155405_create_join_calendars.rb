class CreateJoinCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :join_calendars do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
