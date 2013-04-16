class HackathonsHackers < ActiveRecord::Base
  belongs_to :hackathon
  belongs_to :hacker
  # attr_accessible :title, :body
end
