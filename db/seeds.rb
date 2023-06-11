# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "The most dramatic season yet!")
peter = hannah.contestants.create!(name: "Pilote Pete", age: 34, hometown: "Irving, TX")
taylor = hannah.contestants.create!(name: "Taylor Swift", age: 31, hometown: "Nashville, TN")

kara = Bachelorette.create!(name: "Kara Troll", season_number: 16, description: "The lamest season yet!")
joe = kara.contestants.create!(name: "Joe Dirt", age: 37, hometown: "Smalls, TX")

kickball = Outing.create!(name: "Kickball", location: "Denver", date: "09/01/19")
helicopter_ride = Outing.create!(name: "Helicopter Ride", location: "Bali", date: "09/12/19")
hotsprings = Outing.create!(name: "Hot Springs", location: "Iceland", date: "09/19/19")

co_1 = ContestantOuting.create!(contestant_id: peter.id, outing_id: kickball.id)
co_2 = ContestantOuting.create!(contestant_id: peter.id, outing_id: hotsprings.id)
co_3 = ContestantOuting.create!(contestant_id: taylor.id, outing_id: hotsprings.id)
co_4 = ContestantOuting.create!(contestant_id: joe.id, outing_id: hotsprings.id)
