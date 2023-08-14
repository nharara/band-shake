# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts "creating users"

User.create(email: 'efrenrfranco@gmail.com', password: 'franco')
User.create(email: '555nhara@gmail.com', password: 'hara')
User.create(email: 'jadepeck27@gmail.com', password: 'taron')

puts "3 users created"
