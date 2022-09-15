class Reservation < ApplicationRecord
  belongs_to :user, class_name: 'user', foreign_key: 'user_id'
  belongs_to :vehicle, class_name: 'vehicle', foreign_key: 'vehicle_id'
end
