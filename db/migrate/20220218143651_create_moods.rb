class CreateMoods < ActiveRecord::Migration[6.1]
  def change
    create_table :moods do |t|
      t.string :mood_name
      t.text :mood_notes

      t.timestamps
    end
  end
end
