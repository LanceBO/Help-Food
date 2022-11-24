# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
food1 = Food.new(name: "Kiwi", category: "Fruit", address: "16, villa Gaudelet Paris")
food1.save
food2 = Food.new(name: "Favori", category: "Sando", address: "160 rue oberkampf Paris")
food2.save

food3 = Food.new(name: "Favori", category: "Sando", address: "12 rue oberkampf Paris")
food3.save
