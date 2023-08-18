require 'faker'
require 'open-uri'
require 'nokogiri'
puts "destroying users, offerings and bookings"

User.destroy_all

puts "creating users"

20.times do
  user = User.create!(
    email: Faker::Internet.email,
    age: rand(21..57),
    password: '123123', # needs to be 6 digits,
    full_name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
    phone_number: Faker::Config.locale = 'en-CA',
    city: ['Kyoto', 'Tokyo', 'Yokohama', 'Nagoya', 'Osaka'].sample,
    experience: ['An experienced trombonist and music teacher with 14 years of performance experience and eight years in music education. Studied the principles of trombone performance with Wycliffe Gordon while attending Emory University and performing with the Emory & Henry Marching Band.', 'A classical musician and graduate of The Juilliard School with eight years of experience playing the piano in large concert settings with over 20K attendees. A proven track record of performing with symphony orchestras and premiere music groups, including the Philadelphia Orchestra.', 'Enthusiastic session musician, seeking position with Jerry Norwater Music. As First Violin in the Solano Youth Orchestra, performed La Forza Del Destino Overture by G. Verdi to favorable reviews in the Daily Republic. Commended by music director for hard work and dedication.', 'A dedicated session artist with over 5 years of live performance experience seeks to join Kevin Costner Music to advance my skills while providing a great music experience to the audience. Developing a career with both Orchestra and Chamber music.', 'Dynamic teacher with over 8 years of experience in teaching high-school and bachelor’s level music students seeks to join The Juilliard School as a senior music teacher. In my previous position, I taught a range of subjects such as music composition, live performance, instruments, and sound engineering.'].sample,
    # add any additional attributes you have on your model
  )
  # gender options: 'all' or 'male' or 'female'
  gender = 'all'
  # age options: 'all' or '12-18' or '19-25' or '26-35' or '35-50' or '50+'
  age = '19-40'
  # ethnicity options: 'all' or 'asian' or 'white' or 'black' or 'indian' or 'middle_eastern' or 'latino_hispanic'
  ethnicity = 'all'

  url = "https://this-person-does-not-exist.com/new?gender=#{gender}&age=#{age}&etnic=#{ethnicity}"
  json = URI.open(url).read
  src = JSON.parse(json)['src']
  photo_url = "https://this-person-does-not-exist.com#{src}"
  file = URI.open(photo_url)
  user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

efren = User.create!(
  full_name: 'Efren Franco',
  age: 32,
  phone_number: '080-1233-4562',
  city: 'Kyoto',
  experience: 'played for around 9 months with Linkin Park in 2017',
  email: 'efrenrfranco@gmail.com',
  password: 'efrenfranco'
)
file = URI.open("https://images.pexels.com/photos/4307869/pexels-photo-4307869.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
efren.photo.attach(io: file, filename: "1.jpeg", content_type: "image/jpeg")

nozomu = User.create!(
  full_name: 'Nozomu Hara',
  age: 25,
  phone_number: '080-1233-4563',
  city: 'Yotsuya',
  experience: 'played for almost 5 years with Modern Baseball in 2019',
  email: '555nhara@gmail.com',
  password: 'nozomuhara'
)
file = URI.open("https://avatars.githubusercontent.com/u/135594820?v=4")
nozomu.photo.attach(io: file, filename: "2.jpeg", content_type: "image/jpeg")

pj = User.create!(
  full_name: 'PJ Taron',
  age: 28,
  phone_number: '080-1233-4565',
  city: 'Ootaku',
  experience: 'played during 4 years with West Life in 2017',
  email: 'jadepeck27@gmail.com',
  password: 'pjtaron'
)
file = URI.open("https://avatars.githubusercontent.com/u/122541242?v=4")
pj.photo.attach(io: file, filename: "3.jpeg", content_type: "image/jpeg")

# User.all.each do
#   instruments = ['drums', 'electric guitar', 'acoustic guitar', 'piano', 'violin', 'bass', 'vocals']
#   thousand = rand(20..30)
#   offering = Offering.new(
#     price: thousand * 1000,
#     availability: 'Monday to Friday from 8:00 to 0:00',
#     instrument: instruments.sample
#   )
#   offering.user = User.all.sample
#   offering.save
# end

# images = ["https://images.pexels.com/photos/210922/pexels-photo-210922.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "https://images.pexels.com/photos/111287/pexels-photo-111287.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "https://images.pexels.com/photos/141376/pexels-photo-141376.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"]
# Offering.all.each do |offering|
#   day = rand(1..30)
#   hour1 = rand(8..12)
#   hour2 = rand(16..23)
#   booking = Booking.new(
#     start_date: DateTime.new(2023, 9, day, hour1),
#     end_date: DateTime.new(2023, 9, day, hour2),
#     details: "we are a band of four members that play folk rock, and we are looking someone
#     like you to join us for the next 4 months"
#   )
#   booking.offering = offering
#   booking.user = offering.user
#   booking.save
# end

# file = URI.open(images[2])
# file1 = URI.open(images[0])
# file2 = URI.open(images[1])
# Offering.first.photo.attach(io:file, filename:"offering.jpeg", content_type:"image/jpeg")
# Offering.second.photo.attach(io:file1, filename:"offering.jpeg", content_type:"image/jpeg")
# Offering.last.photo.attach(io:file2, filename:"offering.jpeg", content_type:"image/jpeg")

puts "#{User.count} users created"
