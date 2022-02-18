class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :day, null: false, foreign_key: true
      t.string :title
      t.boolean :status
      t.timestamps
    end
  end
end
