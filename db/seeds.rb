# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

user = User.create!(:firstname => Faker::Name.first_name, :lastname => Faker::Name.last_name, :email => "jolynn@tremblay.com", :password => 'topsecret', :password_confirmation => 'topsecret')
  if user.save
    puts "User added"
  else
    puts "Failed"
  end

day1 = Day.create!(:calendar_date => Date.new(2022,1,1), :user_id => user.id )
day = 1
365.times do

  newDay = Day.create!(:calendar_date => day1.calendar_date + day, :user_id => user.id )
  if newDay.save
    puts "Day #{day} added"
  else
    puts "Failed"
  end
  day = day + 1
end

happy_mood = Mood.create!(mood_name: 'Happy', day: day1 )
if happy_mood.save
    puts "Mood added"
  else
    puts "Failed"
  end


task1 = Task.create!(title: 'Get out of bed', day: day1)
task2 = Task.create!(title: 'Make bed', day: day1)
task3 = Task.create!(title: 'Shower', day: day1)
task4 = Task.create!(title: 'Start essay outline', day: day1)
