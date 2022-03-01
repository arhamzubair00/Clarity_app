class Mood < ApplicationRecord
  belongs_to :day
  validates :mood_notes, length: { maximum: 350 }, allow_blank: true
  validates :mood_name, presence: true
  validates :day_id, presence: true, uniqueness: true
  # validates :mood_name, :inclusion { :in => [ '😡', '😢', '😟', '😐', '🙂', '😍' ] }
end
