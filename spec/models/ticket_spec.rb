require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'Require validations' do
    it 'should has a title' do
      should validate_presence_of(:title)
    end

    it 'should has a due date' do
      should validate_presence_of(:due_date)
    end
  end

  describe 'Has associations' do
    it 'belongs to user' do
      should belong_to(:user)
    end
  end
end
