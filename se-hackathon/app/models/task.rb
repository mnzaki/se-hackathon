class Task < ActiveRecord::Base
  belongs_to :Category
  attr_accessible :description, :minimum_global_level, :name, :points, :time_limit
end
