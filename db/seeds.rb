# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(username: 'Tom')
# first_user.password_confirmation = '123asd'
# first_user.confirm

second_user = User.create(username: 'Lilly')
# second_user.password_confirmation = '123asd'
# second_user.confirm

first_vehicle = Vehicle.create(
  name: 'Vehicle 1',  
  price: 2000,
  image: 'image_url',
  visible: true
)

second_vehicle = Vehicle.create(
  name: 'Vehicle 2',  
  price: 1500,
  image: 'image_url',
  visible: true
)

first_reservation = Reservation.create(
  user_id: first_user.id,
  vehicle_id: first_vehicle.id,
  date: '2022-01-01',
  city: 'Salta'
)

first_reservation = Reservation.create(
  user_id: second_user.id,
  vehicle_id: second_vehicle.id,
  date: '2022-02-02',
  city: 'Salta'
)