class CreateHackathons < ActiveRecord::Migration
  def change
    create_table :hackathons do |t|
      t.string :name
      t.text :description
      t.datetime :time
      t.boolean :active

      t.timestamps
    end
  end
end
