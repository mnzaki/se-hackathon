class AddHackathonToUserStories < ActiveRecord::Migration
  def change
    add_column :user_stories, :hackathon_id, :int
  end
end
