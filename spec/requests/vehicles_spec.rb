require 'swagger_helper'

RSpec.describe 'vehicles', type: :request do
  after(:all) do
    Reservation.destroy_all
    Vehicle.destroy_all
    User.destroy_all
  end

  let(:user) { create(:user) }
  let(:vehicle) { create(:vehicle) }
  let(:id) { vehicle.id }
  let(:Authorization) { Devise::JWT::TestHelpers.auth_headers({}, user)['Authorization'] }

  path '/vehicles' do
    get('list vehicles') do
      tags 'Vehicles'
      security [bearerAuth: []]

      response(200, 'Retrieved list of vehicles successfully.') do
        run_test!
      end

      response(401, 'The current token is not authorized or has expired.') do
        let(:Authorization) { 'wrong' }
        run_test!
      end
    end

    post('create vehicle') do
      tags 'Vehicles'
      consumes 'application/json'
      parameter name: :vehicle, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          price: { type: :number, format: :float },
          image: { type: :string },
          visible: { type: :boolean }
        },
        required: %w[name price image visible]
      }
      security [bearerAuth: []]

      response(200, 'Vehicle created successfully.') do
        let(:vehicle) do
          { vehicle: {
            name: 'Vehicle2',
            price: 120,
            image: 'https://images.immediate.co.uk/production/volatile/sites/4/2022/01/P90447343-highRes-8dac851.jpg',
            visible: true
          } }
        end
        run_test!
      end

      response(401, 'The current token is not authorized or has expired.') do
        let(:Authorization) { 'wrong' }
        run_test!
      end

      response(422, 'Missing required inputs.') do
        let(:vehicle) { { vehicle: { price: '-1' } } }
        run_test!
      end
    end
  end

  path '/vehicles/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show vehicle') do
      tags 'Vehicles'
      security [bearerAuth: []]

      response(200, 'Retrieved vehicle successfully.') do
        run_test!
      end

      response(401, 'The current token is not authorized or has expired.') do
        let(:Authorization) { 'wrong' }
        run_test!
      end
    end

    patch('update vehicle') do
      tags 'Vehicles'
      consumes 'application/json'
      parameter name: :vehicle, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          price: { type: :number, format: :float },
          image: { type: :string },
          visible: { type: :boolean }
        }

      }
      security [bearerAuth: []]

      response(200, 'Successful response.') do
        run_test!
      end

      response(401, 'The current token is not authorized or has expired.') do
        let(:Authorization) { 'wrong' }
        run_test!
      end
    end
  end
end
