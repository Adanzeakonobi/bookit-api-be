require 'rails_helper'

RSpec.describe Reservation, type: :model do
  context 'validations' do
    before do
      @user = create(:user)
      @vehicle = create(:vehicle)
      @reservation = create(:reservation, user_id: @user.id, vehicle_id: @vehicle.id)
    end

    describe 'are valid' do
      it 'when attributes are present' do
        expect(@reservation).to be_valid
      end
    end

    describe 'nil city' do
      it 'is not valid' do
        @reservation.city = nil
        expect(@reservation).to_not be_valid
      end
    end

    describe 'nil date' do
      it 'is not valid' do
        @reservation.date = nil
        expect(@reservation).to_not be_valid
      end
    end

    describe 'nil user_id' do
      it 'is not valid' do
        @reservation.user_id = nil
        expect(@reservation).to_not be_valid
      end
    end

    describe 'nil vehicle_id' do
      it 'is not valid' do
        @reservation.vehicle_id = nil
        expect(@reservation).to_not be_valid
      end
    end
  end
end
