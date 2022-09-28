FactoryBot.define do
  factory :user do
    username { 'Thomas' }
    email { 'tom@example.com' }
    password { '123asd' }
    role { 'admin' }
  end
end
