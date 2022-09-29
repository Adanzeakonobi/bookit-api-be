require 'swagger_helper'

RSpec.describe 'reservations', type: :request do
  after(:all) do
    Reservation.destroy_all
    Vehicle.destroy_all
    User.destroy_all
  end

  let(:user) { create(:user) }
  let(:vehicle) { create(:vehicle) }
  let(:id) { vehicle.id }
  let(:reservation) { create(:reservation) }
  let(:Authorization) { Devise::JWT::TestHelpers.auth_headers({}, user)['Authorization'] }

  path '/reservations' do
    get('list reservations') do
      tags 'Reservations'
      security [bearerAuth: []]

      response(200, 'Successful response.') do
        run_test!
      end

      response(401, 'The current token is not authorized or has expired.') do
        let(:Authorization) { 'wrong' }
        run_test!
      end
    end

    post('create reservation') do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :string, format: :date },
          city: { type: :string },
          vehicle_id: { type: :integer }
        },
        required: %w[date city vehicle_id user_id]
      }
      security [bearerAuth: []]

      response(200, 'Successful response.') do
        let(:reservation) do
          { reservation: {
            vehicle_id: vehicle.id,
            user_id: user.id,
            date: '02-12-2022',
            city: 'Salta'
          } }
        end
        run_test!
      end

      response(401, 'The current token is not authorized or has expired.') do
        let(:Authorization) { 'wrong' }
        let(:reservation) do
          { reservation: {
            vehicle_id: vehicle.id,
            user_id: user.id,
            date: '02-12-2022',
            city: 'Salta'
          } }
        end
        run_test!
      end

      response(422, 'Missing required inputs.') do
        let(:reservation) { { reservation: { city: '' } } }
        run_test!
      end
    end
  end
end
