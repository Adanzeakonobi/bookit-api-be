require 'swagger_helper'

RSpec.describe 'uploadcare', type: :request do
  after(:all) do
    Reservation.destroy_all
    Vehicle.destroy_all
    User.destroy_all
  end

  let(:user) { create(:user) }
  let(:Authorization) { Devise::JWT::TestHelpers.auth_headers({}, user)['Authorization'] }

  path '/uploadcare/auth_params' do
    get('generate uploadcare authentication parameters') do
      tags 'UploadCare'
      security [bearerAuth: []]

      response(200, 'UploadCare authentication parameters generated.') do
        run_test!
      end
    end
  end
end
