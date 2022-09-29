require 'swagger_helper'

RSpec.describe 'users/registrations', type: :request do
  after(:all) do
    Reservation.destroy_all
    Vehicle.destroy_all
    User.destroy_all
  end

  let!(:user) { create(:user) }

  path '/users' do
    post('new registration') do
      tags 'User Registrations'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              username: { type: :string },
              email: { type: :string, pattern: '^\S+@\S+\.\S+$', format: :email },
              role: { type: :string },
              password: { type: :string, format: :password },
              password_confirmation: { type: :string, format: :password }
            },
            required: %w[username email role password password_confirmation]
          }
        },
        required: %w[user]
      }

      response(200, 'Created account successfully.') do
        let(:user) { { user: attributes_for(:user) } }
        run_test!
      end

      response(422, 'Cannot create accounts with those inputs.') do
        let(:user) { { user: {} } }
        run_test!
      end
    end
  end
end
