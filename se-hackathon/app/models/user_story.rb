class UserStory < ActiveRecord::Base
  attr_accessible :description, :number, :hackathon_id, :as => [:admin, :default]
  has_many :tasks

  belongs_to :hackathon
end
