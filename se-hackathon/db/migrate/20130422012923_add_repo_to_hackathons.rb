class AddRepoToHackathons < ActiveRecord::Migration
  def change
    add_column :hackathons, :supervisor, :int
    add_column :hackathons, :repo, :string
  end
end
