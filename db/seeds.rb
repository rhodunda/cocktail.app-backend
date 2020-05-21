# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
brandon = User.create(email: 'brandon@brandon.com', password: 'brandon')
moxxie = User.create(email: 'moxxie@moxxie.com', password: 'moxxie')
bryan = User.create(email: 'bryan@bryan.com', password: 'bryan')