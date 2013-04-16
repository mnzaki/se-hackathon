class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :points
      t.integer :minimum_global_level
      t.integer :time_limit
      t.references :Category

      t.timestamps
    end
    add_index :tasks, :Category_id
  end
end
