# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "destroying users, offerings and bookings"

User.destroy_all

puts "creating users, offerings and bookings"

User.create!(
  full_name: 'Efren Franco',
  age: 32,
  phone_number: '080-1233-4562',
  city: 'Kyoto',
  experience: 'played the drums with Linkin Park in 2017',
  email: 'efrenrfranco@gmail.com',
  password: 'efrenfranco'
)

User.create!(
  full_name: 'Nozomu Hara',
  age: 35,
  phone_number: '080-1233-4563',
  city: 'Yotsuya',
  experience: 'played the electric guitar with Modern Baseball in 2019',
  email: '555nhara@gmail.com',
  password: 'nozomuhara'
)

User.create!(
  full_name: 'PJ Taron',
  age: 28,
  phone_number: '080-1233-4565',
  city: 'Ootaku',
  experience: 'played the acoustic guitar with West Life in 2017',
  email: 'jadepeck27@gmail.com',
  password: 'pjtaron'
)

User.all.each_with_index do |user, index|
  instruments = ['drums', 'electric guitar', 'acoustic guitar']
  thousand = rand(5..10)
  offering = Offering.new(
    price: thousand * 1000,
    availability: 'Monday to Friday from 8:00 to 0:00',
    instrument: instruments[index]
  )
  offering.user = user
  offering.save
end

Offering.all.each do |offering|
  day = rand(1..30)
  hour1 = rand(8..12)
  hour2 = rand(16..23)
  booking = Booking.new(
    start_date: DateTime.new(2023, 9, day, hour1),
    end_date: DateTime.new(2023, 9, day, hour2),
    details: "we are a band of four members that play folk rock, and we are looking someone
    like you to join us for the next 4 months"
  )
  booking.offering = offering
  booking.user = offering.user
  booking.save
end

puts "3 users, offerings and bookings created"
