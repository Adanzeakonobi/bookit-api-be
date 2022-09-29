require 'rails_helper'

RSpec.describe User, type: :feature do
  context 'validations' do
    before do
      @user = create(:user)
    end

    after do
      @user.destroy
    end

    describe 'pass' do
      it 'when attributes are present' do
        expect(@user).to be_valid
        expect(@user.username.length).to be >= 6
        expect(@user.username.length).to be <= 128
      end
    end

    describe 'nil username' do
      it 'is not valid' do
        @user.username = nil
        expect(@user).to_not be_valid
      end
    end

    describe 'nil role' do
      it 'is not valid' do
        @user.role = nil
        expect(@user).to_not be_valid
      end
    end
  end
end
