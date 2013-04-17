class AddLevelToHackathon < ActiveRecord::Migration
  def change
    add_column :hackathons, :level, :int
  end
end
