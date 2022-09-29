class Vehicle < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ },
                    numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1_000_000 }
  validates :image, presence: true,
                    format: {
                      with: /\.png|jpg|jpeg|svg/i,
                      message: 'Link accepts formats: png, jpg, jpeg, svg.'
                    }, uniqueness: true
  validates_url :image

  validates :visible, inclusion: [true, false]

  def self.vehicles(role)
    case role
    when 'admin'
      vehicles = Vehicle.all
    when 'user'
      vehicles = Vehicle.where(visible: true)
    end
    { vehicles: }
  end

  def allreservations
    reservations.where('date >= ?', Date.today.to_s)
  end
end
