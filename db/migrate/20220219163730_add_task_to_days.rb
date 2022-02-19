class AddTaskToDays < ActiveRecord::Migration[6.1]
  def change
    add_column :days, :task, :string, array: true, default: []
  end
end
