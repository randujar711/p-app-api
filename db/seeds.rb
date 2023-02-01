# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create!(email: 'example@gmail.com', password: '123456', username: 'user1', balance: 100)
user2 = User.create!(email: 'example2@gmail.com', password: '123456', username: 'user2', balance: 400)

p 'created user'

p 'creating parking spot coordinates'

spot1 = Parking.create!(latitude: 40.72483283211204, longitude: -73.98419902542564, price: 1, date: '2023-04-04', occupied: false, user_id: 1)

spot2 = Parking.create!(latitude: 40.72475965427959, longitude: -73.98427412727926, price: 2, date: '2023-04-08', occupied: false, user_id: 1)

spot3 = Parking.create!(latitude: 40.7245645129997, longitude: -73.98356602408784, price: 3, date: '2023-3-04', occupied: false, user_id: 1)

spot4 = Parking.create!(latitude: 40.7245645129997, longitude: -73.98381278732121, price: 4, date: '2023-09-04', occupied: false, user_id: 1)

spot5 = Parking.create!(latitude: 40.72449133487224, longitude: -73.98335144736315, price: 5, date: '2023-05-04', occupied: false, user_id: 1)

spot6 = Parking.create!(latitude: 40.72437750206958, longitude: -73.98332998969069, price: 6, date: '2023-06-04', occupied: false, user_id: 1)

spot7 = Parking.create!(latitude: 40.72403600249344, longitude: -73.98226783490352, price: 7, date: '2023-07-04', occupied: false, user_id: 1)

spot8 = Parking.create!(latitude: 40.72397908572706, longitude: -73.98237512326587, price: 8, date: '2023-08-04', occupied: false, user_id: 1)



p 'created seller'
seller1 = Seller.create!(username: 'sellerexample', balance: 100)

p 'done'