class Hackathon < ActiveRecord::Base
  attr_accessible :active, :description, :name, :time

  has_and_belongs_to_many :hackers
  has_many :user_stories

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

  def git
    @git ||= Rugged::Repository.new("#{storage_path}/repo")
  end

  def tests_path
    "#{storage_path}/tests"
  end
end
