class UserStory < ActiveRecord::Base
  attr_accessible :description, :number, :as => [:admin, :default]
  has_many :tasks

  belongs_to :hackathon
end