class Mood < ApplicationRecord
  belongs_to :day
  # mood_name is the emoji
  # moods =  ['Angry', 'Sad', 'Meh', 'Neutral', 'Happy', 'Excited']
  # moods_emojis =  [ '😡', '😢', '😟', '😐', '🙂', '😍' ]
  # mood_notes is the notes the user may or may not add

  validates :mood_notes, length: { maximum: 350 }, allow_blank: true
  # validates :mood_name, :inclusion { :in => [ '😡', '😢', '😟', '😐', '🙂', '😍' ] }

  validates :mood_name, presence: true
end
