require 'rails_helper'

RSpec.describe 'Creating User', type: :request do
  before do
    @headers = {}
  end

  context 'with valid data' do
    it 'should create user' do
      expect(User.count).to eq(0)

      params = { 
        'user[name]' => 'Amir',
        'user[email]' => 'amir@email.com',
        'user[send_due_date_reminder]' => true,
        'user[due_date_reminder_interval]' => 1,
        'user[due_date_reminder_time]' => Time.now
      }

      post '/v1/users', headers: @headers, params: params

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response.code).to eq('200')
      expect(User.count).to eq(1)
      expect(User.first.name).to eq('Amir')
      expect(response_body[:name]).to eq('Amir')
    end
  end

  context 'with invalid data' do
    it 'should not create user without name or email' do
      expect(User.count).to eq(0)

      params = { 
        'user[name]' => '',
        'user[email]' => '',
        'user[send_due_date_reminder]' => true,
        'user[due_date_reminder_interval]' => 1,
        'user[due_date_reminder_time]' => Time.now
      }

      post '/v1/users', headers: @headers, params: params

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(User.count).to eq(0)
      expect(response.code).to eq('422')
      expect(response_body[:details].first).to eq('Name can\'t be blank')
      expect(response_body[:details].last).to eq('Email can\'t be blank')
    end
  end
end
