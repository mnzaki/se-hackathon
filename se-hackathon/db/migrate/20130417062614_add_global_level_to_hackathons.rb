class AddGlobalLevelToHackathons < ActiveRecord::Migration
  def change
    add_column :hackathons, :global_level, :integer
  end
end
