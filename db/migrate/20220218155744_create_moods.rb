class CreateMoods < ActiveRecord::Migration[6.1]
  def change
    create_table :moods do |t|
      t.references :day, null: false, foreign_key: true
      t.string :mood_name, default: "&#128528"
      t.text :mood_notes
      t.timestamps
    end
  end
end
