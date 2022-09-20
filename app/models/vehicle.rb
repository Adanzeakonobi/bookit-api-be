class Vehicle < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  validates :name, presence: true
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ },
                    numericality: { greater_than: 0, less_than: 1_000_000 }
  validates :image, presence: true
  validates :visible, inclusion: [true, false]

  def self.vehicles
    vehicles = Vehicle.all
    return vehicles unless vehicles.empty?

    { error: 'There are no vehicles in the list' }
  end
end
