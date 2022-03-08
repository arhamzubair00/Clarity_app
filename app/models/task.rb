class Task < ApplicationRecord
  belongs_to :day
  validates :title, presence: true,  allow_blank: false, length: 3..32
  validates :day_id, presence: true
end
