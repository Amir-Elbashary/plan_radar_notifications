require 'rails_helper'

RSpec.describe 'Updating User info', type: :request do
  before do
    @user = create(:user)
  end

  context 'with valid data' do
    it 'should update user info' do
      params = {
        'user[name]' => 'Amir',
        'user[email]' => 'amir@email.com',
        'user[send_due_date_reminder]' => true,
        'user[due_date_reminder_interval]' => 1,
        'user[due_date_reminder_time]' => Time.now
      }

      put "/v1/users/#{@user.id}", headers: @headers, params: params

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response.code).to eq('200')
      expect(response_body[:name]).to eq('Amir')
      expect(User.first.name).to eq('Amir')
    end
  end
end
