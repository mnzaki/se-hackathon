class Finish < ActiveRecord::Base
  belongs_to :task
  belongs_to :hacker
  # attr_accessible :title, :body
end
