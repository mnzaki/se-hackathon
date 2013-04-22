class AddColumnsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :finshed_by, :integer
    add_column :tasks, :finished_at, :datetime
  end
end
