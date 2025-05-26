require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Require validations' do
    it 'should has a name' do
      should validate_presence_of(:name)
    end

    it 'should has an email' do
      should validate_presence_of(:email)
    end
  end

  describe 'Has associations' do
    it 'has many tickets' do
      should have_many(:tickets)
    end
  end
end
