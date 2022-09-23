class Reservation < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :vehicle, class_name: 'Vehicle', foreign_key: 'vehicle_id'

  validates :user_id, presence: true
  validates :vehicle_id, presence: true
  validates :date, presence: true, date: { after: Time.now - 1.days, before: Time.now + 1.year }
  validates :city, presence: true
  validates_uniqueness_of :vehicle_id, scope: %i[city date],
                                       message: 'This vehicle has already been reserved on this date and city.'

  def self.reservations(id)
    @reservations = Reservation.where(user_id: id)
    { reservations: @reservations }
  end
end
