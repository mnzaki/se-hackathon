class Hackathon < ActiveRecord::Base
  attr_accessible :active, :description, :name, :repo, :time, :level

  has_and_belongs_to_many :hackers
  has_many :user_stories
  belongs_to :supervisor, class_name: 'Hacker'

  HACKATHONS_ROOT = "#{::Rails.root}/hackathons"

  def self.active
    unless @@active and @@active.active?
      @@active = Hackathon.where(active: true).first
    end
    @@active
  end

  def storage_path
    "#{HACKATHONS_ROOT}/#{id}"
  end

  def tests_path
    "#{storage_path}/tests"
  end
end
