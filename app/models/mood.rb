class Mood < ApplicationRecord
  # mood_name is the emoji
  # moods =  ['Angry', 'Sad', 'Meh', 'Neutral', 'Happy', 'Excited']
  # moods_emojis =  [ '😡', '😢', '😟', '😐', '🙂', '😍' ]
  # mood_notes is the notes the user may or may not add

  belongs_to :day
  validates :mood_notes, length: { maximum: 350 }, allow_blank: true
  validates :mood_name, presence: true
  validates :day_id, presence: true, uniqueness: true
  # validates :mood_name, :inclusion { :in => [ '😡', '😢', '😟', '😐', '🙂', '😍' ] }

end
