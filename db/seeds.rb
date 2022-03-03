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
day1 = Date.new(2022, 1, 1)
day = 1
365.times do
  newDay = Day.create!(:calendar_date => day1 + day, :user_id => user.id )

  if newDay.save
    puts "Day #{day} added"
  else
    puts "Failed"
  end

  happy_mood = Mood.create!(day: newDay)
  if happy_mood.save
    puts "Mood #{day} added"
  else
    puts "Failed"
  end

  day = day += 1
end

angry = '😡'
sad = '😢'
meh = '😟'
neutral = '😐'
happy = '🙂'
excited = '😍'

all_the_moods = [angry, sad, meh, neutral, happy, excited]

task1 = Task.create!(title: 'Call supplier for delivery details', day: Day.find(60))
task2 = Task.create!(title: 'Make bed', day: Day.find(60))
task3 = Task.create!(title: 'Shower', day: Day.find(60))
task4 = Task.create!(title: 'Start essay outline', day: Day.find(60))
