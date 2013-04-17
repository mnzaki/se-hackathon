class CreateFinishes < ActiveRecord::Migration
  def change
    create_table :finishes do |t|
      t.references :task
      t.references :hacker

      t.timestamps
    end
    add_index :finishes, :task_id
    add_index :finishes, :hacker_id
  end
end
