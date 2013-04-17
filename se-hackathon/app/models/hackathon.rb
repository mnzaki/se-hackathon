class Hackathon < ActiveRecord::Base
  attr_accessible :active, :description, :name, :time

  has_and_belongs_to_many :hackers
  has_many :user_stories
end
