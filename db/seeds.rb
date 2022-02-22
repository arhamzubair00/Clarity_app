# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

user = User.create! :email => Faker::Internet.email, :password => 'topsecret', :password_confirmation => 'topsecret'
  if user.save
    puts "User added"
  else
    puts "Failed"
  end

day = Day.create!(:calendar_date => Date.today, :user_id => user.id )

happy_mood = Mood.create!(mood_name: 'Happy', day: day )
