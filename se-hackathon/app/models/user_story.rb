class UserStory < ActiveRecord::Base
  attr_accessible :description, :number
  has_many :tasks

  belongs_to :hackathon
end
