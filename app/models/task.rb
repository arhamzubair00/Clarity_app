class Task < ApplicationRecord
  belongs_to :day
  validates :title, presence: true,  allow_blank: false
  validates :day_id, presence: true
end
