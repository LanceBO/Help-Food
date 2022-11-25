# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Booking.destroy_all
Food.destroy_all
User.destroy_all

user = User.create(email: "fclens@gmail.com", password: "123456", first_name: "Baptiste", last_name: "Tehé", address: "10 rue de la Paix")

food1 = Food.new(name: "Apple", category: "Fruit/Vegetable", expiration_date: "2022-11-25 00:00:00.000000000 +0000", user: User.last, created_at: nil, updated_at: nil, photo: nil, latitude: nil, longitude: nil, address: "2 Avenue des Saules 59160 Lille")
food1.photo.attach(io: File.open("#{Rails.root}/app/assets/images/pomme.jpg"), filename: 'pomme.jpg', content_type: 'image/jpg')
food1.save

food2 = Food.new(name: "McChicken", category: "Sandwich", expiration_date: "2022-11-26 00:00:00.000000000 +0000", user: User.last, created_at: nil, updated_at: nil, photo: nil, latitude: nil, longitude: nil, address: "16 Vla Gaudelet, 75011 Paris")
food2.photo.attach(io: File.open("#{Rails.root}/app/assets/images/burger.jpg"), filename: 'burger.jpg', content_type: 'image/jpg')
food2.save

food3 = Food.new(name: "Pizza Crust", category: "Meal", expiration_date: "2022-11-27 00:00:00.000000000 +0000", user: User.last, created_at: nil, updated_at: nil, photo: nil, latitude: nil, longitude: nil, address: "IJsbaanpad 9, 1076 CV Amsterdam, Pays-Bas")
food3.photo.attach(io: File.open("#{Rails.root}/app/assets/images/pizza-crust-leftovers.jpg"), filename: 'pizza-crust-leftovers.jpg', content_type: 'image/jpg')
food3.save

food4 = Food.new(name: "Milk", category: "Drink", expiration_date: "2022-11-28 00:00:00.000000000 +0000", user: User.last, created_at: nil, updated_at: nil, photo: nil, latitude: nil, longitude: nil, address: "Carrer del Bruc, 149, 08037 Barcelona, Spain")
food4.photo.attach(io: File.open("#{Rails.root}/app/assets/images/lait.jpg"), filename: 'lait.jpg', content_type: 'image/jpg')
food4.save

food5 = Food.new(name: "Vermicelli Soup", category: "Drink", expiration_date: "2022-11-29 00:00:00.000000000 +0000", user: User.last, created_at: nil, updated_at: nil, photo: nil, latitude: nil, longitude: nil, address: "24 Rue du Commandant Guilbaud, 75016 Paris")
food5.photo.attach(io: File.open("#{Rails.root}/app/assets/images/kaka.jpg"), filename: 'kaka.jpg', content_type: 'image/jpg')
food5.save

food6 = Food.new(name: "Chocolate Chip Pudding", category: "Drink", expiration_date: "2022-11-30 00:00:00.000000000 +0000", user: User.last, created_at: nil, updated_at: nil, photo: nil, latitude: nil, longitude: nil, address: "Av. Alfred Maes, 62300 Lens")
food6.photo.attach(io: File.open("#{Rails.root}/app/assets/images/openda.jpg"), filename: 'openda.jpg', content_type: 'image/jpg')
food6.save
