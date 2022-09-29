class User < ApplicationRecord
  has_many :reservations
  has_many :vehicles, through: :reservations

  devise :database_authenticatable, :registerable, :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  validates :username, presence: true, length: { minimum: 6, maximum: 128 }
  validates :role, inclusion: { in: %w[user admin],
                                message: '%<value>s is not a valid role' }
  validates :email, presence: true, uniqueness: true

  validate :password_and_confirmation_equal

  def password_and_confirmation_equal
    errors.add(:password_confirmation, 'does not match password') if password != password_confirmation
  end

  def all_reservations
    reservations
  end

  def admin?
    role == 'admin'
  end
end
