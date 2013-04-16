class CreateClaims < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.references :task
      t.references :hacker

      t.timestamps
    end
    add_index :claims, :task_id
    add_index :claims, :hacker_id
  end
end
