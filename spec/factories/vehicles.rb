FactoryBot.define do
  factory :vehicle do
    name { 'Car' }
    image { 'https://www.pngrepo.com/png/123920/512/workers-team.png' }
    price { 100.00 }
    visible { true }
  end
end
