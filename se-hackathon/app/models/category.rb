class Category < ActiveRecord::Base
  attr_accessible :name, :as => :admin
end
