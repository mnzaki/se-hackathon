class CreateTablePrequisitesTasks < ActiveRecord::Migration
  def change
    create_table :prequisites_tasks, :id => false do |t|
      t.integer :task_id
      t.integer :prequisite_id
    end
  end
end
