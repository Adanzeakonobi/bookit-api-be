require 'swagger_helper'

RSpec.describe 'users/sessions', type: :request do
  let!(:user) { create(:user) }

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
        let(:user) { { user: { email: 'tom@example.com', password: '123asd' } } }
        run_test!
      end

      response(401, 'Those credentials do not match an account.') do
        let(:user) { { user: { email: 'tom@example.com', password: '123' } } }
        run_test!
      end
    end
  end

  # path '/users/sign_out' do
  #   delete('delete session') do
  #     tags 'Users Sessions'
  #     security [bearerAuth: []]
  #     response(200, 'Sign out was successful.') do
  #       let(:Authorization) { "Bearer #{token_for(user)}" }
  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end

  #     response(401, 'Cannot sign out with provided token.') do
  #       let(:Authorization) { "Bearer #{token_for(user)}" }
  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end
  # end
end
