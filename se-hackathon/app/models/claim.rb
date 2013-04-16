class Claim < ActiveRecord::Base
  belongs_to :task
  belongs_to :hacker
  attr_accessible :claimed_at , :as => [:default, :admin]
end
