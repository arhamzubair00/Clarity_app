class Day < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_one :mood

  validates :calendar_date, presence: true, uniqueness: { scope: :user_id }
end
