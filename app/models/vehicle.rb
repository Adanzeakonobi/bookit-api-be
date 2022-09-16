class Vehicle < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  def self.vehicles
    vehicles = Vehicle.all
    return vehicles.first.slice(:message) unless vehicles.empty?

    { message: 'There are no vehicles in the list' }
  end
end
