# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# User
user = User.create!(:firstname => Faker::Name.first_name, :lastname => Faker::Name.last_name, :email => "arham@tremblay.com", :password => 'topsecret', :password_confirmation => 'topsecret')
  if user.save
    puts "User added"
  else
    puts "Failed"
  end

# Day
# day1 = Day.create!(:calendar_date => Date.new(2022,1,1), :user_id => user.id )
# day = 1
# 365.times do
#   newDay = Day.create!(:calendar_date => day1.calendar_date + day, :user_id => user.id )
#   if newDay.save
#     puts "Day #{day} added"
#   else
#     puts "Failed"
#   end
#   day = day + 1
# end

# Task
# task1 = Task.create!(title: 'Get out of bed', day: day1)
# task2 = Task.create!(title: 'Make bed', day: day1)
# task3 = Task.create!(title: 'Shower', day: day1)
# task4 = Task.create!(title: 'Start essay outline', day: day1)


# Mood

# angry = '&#128545'
# sad = '&#128546'
# meh = '&#128543'
# neutral = '&#128528'
# happy = '&#128578'
# excited = '&#128525'

angry = '😡'
sad = '😢'
meh = '😟'
neutral = '😐'
happy = '🙂'
excited = '😍'

all_the_moods = [angry, sad, meh, neutral, happy, excited]

# happy_mood = Mood.create!(mood_name: happy, mood_notes: "I've had a great day today. Got loads done!", day: day1)
# angry_mood = Mood.create!(mood_name: angry, mood_notes: "I've had the worst day. So unproductive!", day: newDay)


# if happy_mood.save
#   puts "Mood added"
# else
#   puts "Failed"
# end

# <%= @day.calendar_date.strftime('%a, %d %b %Y') %>


arham_day1 = Day.create!(:calendar_date => Date.new(2022,1,1), :user_id => user.id )
day_and_mood = 1

365.times do
  newDay = Day.create!(:calendar_date => arham_day1.calendar_date + day_and_mood, :user_id => user.id )
  mood = Mood.create!(mood_name: all_the_moods.sample, mood_notes: "Just some placeholder text...", day: newDay)
  if newDay.save
    puts "Day #{day_and_mood} added"
  else
    puts "Failed"
  end
  day_and_mood += 1
end
