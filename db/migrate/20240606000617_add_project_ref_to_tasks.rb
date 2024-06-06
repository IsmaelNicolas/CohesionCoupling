class AddProjectRefToTasks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :project, foreign_key: true, default: 1
  end
end
