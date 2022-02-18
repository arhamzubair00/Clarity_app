class Day < ApplicationRecord
  belongs_to :join_calendar
  has_many :tasks
  has_one :mood
end
