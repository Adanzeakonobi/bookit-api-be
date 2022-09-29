require 'swagger_helper'

RSpec.describe 'users/sessions', type: :request do
  after(:all) do
    Reservation.destroy_all
    Vehicle.destroy_all
    User.destroy_all
  end

  let(:user) { create(:user) }
  let(:Authorization) { Devise::JWT::TestHelpers.auth_headers({}, user)['Authorization'] }

  path '/users/sign_in' do
    post('create session') do
      tags 'Users Sessions'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string, pattern: '^\S+@\S+\.\S+$', format: :email },
              password: { type: :string, format: :password }
            },
            required: %w[email password]
          }
        },
        required: %w[user]
      }

      response(200, 'Sign in was successful.') do
        let(:u) { create(:user) }
        let(:user) { { user: { email: u.email, password: u.password } } }
        run_test!
      end

      response(401, 'Those credentials do not match an account.') do
        let(:user) { { user: { email: 'tom@example.com', password: '123' } } }
        run_test!
      end
    end
  end

  path '/users/sign_out' do
    delete('delete session') do
      tags 'Users Sessions'
      security [bearerAuth: []]

      response(200, 'Sign out was successful.') do
        run_test!
      end

      response(401, 'Cannot sign out with provided token.') do
        let(:Authorization) { 'wrong' }
        run_test!
      end
    end
  end
end
