class User < ApplicationRecord
  has_many :reservations
  has_many :vehicles, through: :reservations
  devise :database_authenticatable, :registerable, :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  validates :username, length: { minimum: 3 }, presence: true
  validates :role, inclusion: { in: %w[user admin],
                                message: '%<value>s is not a valid role' }
end
