class JoinCalendar < ApplicationRecord
  belongs_to :user
  has_many :days
end
