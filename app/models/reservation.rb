class Reservation < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :vehicle, class_name: 'Vehicle', foreign_key: 'vehicle_id'

  validates :user_id, presence: true
  validates :vehicle_id, presence: true
  validates :date, presence: true
  validates :city, presence: true
  validates_uniqueness_of :user_id, scope: :vehicle_id, message: 'You already made a reservation for this vehicle.'

  def reserved_vehicle
    vehicle
  end
end
