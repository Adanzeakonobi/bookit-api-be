FactoryBot.define do
  factory :reservation do
    vehicle_id { 1 }
    user_id { 1 }
    date { '02-10-2022' }
    city { 'Mty' }
  end
end
