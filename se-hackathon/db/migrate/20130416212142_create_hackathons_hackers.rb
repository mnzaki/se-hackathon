class CreateHackathonsHackers < ActiveRecord::Migration
  def change
    create_table :hackathons_hackers do |t|
      t.references :hackathon
      t.references :hacker

      t.timestamps
    end
    add_index :hackathons_hackers, :hackathon_id
    add_index :hackathons_hackers, :hacker_id
  end
end
