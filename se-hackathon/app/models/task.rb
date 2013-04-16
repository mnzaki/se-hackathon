class Task < ActiveRecord::Base
  belongs_to :category
  belongs_to :user_story
  has_many :claims
  has_many :hackers, :through => :claims

  attr_accessible :description, :minimum_global_level, :name, :points,
                  :time_limit, :category_id, :user_story_id,
                  :as => [:default, :admin]


  def claimable?
    if claims = []
      return true
    else
      claims.last.claimed_at < time_limit.minutes.ago
    end
  end
end
