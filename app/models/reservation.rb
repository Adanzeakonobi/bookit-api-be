class Reservation < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :vehicle, class_name: 'Vehicle', foreign_key: 'vehicle_id'

  validates :user_id, presence: true
  validates :vehicle_id, presence: true
  validates :date, presence: true
  validates :city, presence: true
  validates_uniqueness_of :vehicle_id, scope: %i[city date],
                                       message: 'This vehicle has already been reserved on this date and city.'

  def self.reservations(id)
    @reservations = Reservation.where(user_id: id)
    return @reservations unless @reservations.empty?

    { message: 'You have no reservations.' }
  end
end
