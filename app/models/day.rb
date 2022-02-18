class Day < ApplicationRecord
  has_many :tasks
  belongs_to :mood
  belongs_to :calendar
  #should have many tasks
  #should have a mood
end
