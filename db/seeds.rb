# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(username: 'Thomas', role: 'admin', email: 'tom@example.com')
first_user.password = '123asd'
first_user.password_confirmation = '123asd'
first_user.save

second_user = User.create(username: 'Lillian', role: 'user', email: 'lilly@example.com')
second_user.password = '123asd'
second_user.password_confirmation = '123asd'
second_user.save

first_vehicle = Vehicle.create(
  name: 'Vehicle 1',  
  price: 2000.00,
  image: 'image_url',
  visible: true
)

second_vehicle = Vehicle.create(
  name: 'Vehicle 2',  
  price: 1500.00,
  image: 'image_url',
  visible: true
)

first_reservation = Reservation.create(
  user_id: first_user.id,
  vehicle_id: first_vehicle.id,
  date: '2022-01-01',
  city: 'Salta'
)

second_reservation = Reservation.create(
  user_id: second_user.id,
  vehicle_id: second_vehicle.id,
  date: '2022-02-02',
  city: 'Salta'
)
