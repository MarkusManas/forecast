# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Location.create({
  name: 'Manila',
  latitude: 14.599512,
  longitude: 120.984222,
  timezone: 'Asia/Manila'
})

Location.create({
  name: 'Tagaytay',
  latitude: 14.1153,
  longitude: 120.9621,
  timezone: 'Asia/Manila'
})

Location.create({
  name: 'Gothenburg',
  latitude: 57.7089,
  longitude: 11.97456,
  timezone: 'Europe/Stockholm'
})

Location.create({
  name: 'Buenos Aires',
  latitude: -34.603722,
  longitude: -58.381592,
  timezone: 'America/Argentina/Buenos_Aires'
})