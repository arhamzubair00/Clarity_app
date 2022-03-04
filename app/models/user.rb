class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :days

  after_create do
    day1 = Date.new(2022, 1, 1)
    day = 0

    365.times do
      newDay = Day.create!(:calendar_date => day1 + day, :user_id => self.id )

      if newDay.save
        puts "Day #{day + 1} added"
      else
        puts "Failed"
      end

      mood = Mood.create!(day: newDay)
      if mood.save
        puts "Mood #{day + 1} added"
      else
        puts "Failed"
      end

      day = day += 1
    end
  end
end
