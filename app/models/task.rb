class Task < ApplicationRecord
  belongs_to :day
  validates :title, presence: true, length: {minimum: 5, maximum: 30}, allow_blank: false
  validates :day_id, presence: true
end
