require 'rails_helper'

RSpec.describe Reservation, type: :model do
  context 'validations' do
    before do
      @user = create(:user)
      @vehicle = create(:vehicle)
    end

    after do
      @vehicle.destroy
      @user.destroy
    end

    describe 'are valid' do
      it 'when attributes are present' do
        expect(@vehicle).to be_valid
      end
    end

    describe 'nil name' do
      it 'is not valid' do
        @vehicle.name = nil
        expect(@vehicle).to_not be_valid
      end
    end

    describe 'nil date' do
      it 'is not valid' do
        @vehicle.price = nil
        expect(@vehicle).to_not be_valid
      end
    end

    describe 'nil user_id' do
      it 'is not valid' do
        @vehicle.image = nil
        expect(@vehicle).to_not be_valid
      end
    end

    describe 'nil vehicle_id' do
      it 'is not valid' do
        @vehicle.visible = nil
        expect(@vehicle).to_not be_valid
      end
    end

    describe 'price' do
      it 'is an integer equal or greater than cero' do
        @vehicle.price = -1
        expect(@vehicle).to_not be_valid
      end
    end
  end
end
