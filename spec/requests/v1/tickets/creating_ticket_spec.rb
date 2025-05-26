require 'rails_helper'

RSpec.describe 'Creating Ticket', type: :request do
  before do
    @headers = {}
    @user = create(:user)
  end

  context 'with valid data' do
    it 'should create a ticket' do
      expect(Ticket.count).to eq(0)

      params = { 
        'ticket[user_id]' => @user.id,
        'ticket[title]' => 'New Ticket',
        'ticket[description]' => 'Remind me of something',
        'ticket[due_date]' => (Time.now + 2.minutes),
        'ticket[status_id]' => '1',
        'ticket[progress]' => '1'
      }

      post '/v1/tickets', headers: @headers, params: params

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response.code).to eq('200')
      expect(Ticket.count).to eq(1)
      expect(User.first.tickets.count).to eq(1)
      expect(Ticket.first.title).to eq('New Ticket')
      expect(response_body[:title]).to eq('New Ticket')
    end
  end

  context 'with invalid data' do
    it 'should not create ticket without title or due date' do
      expect(Ticket.count).to eq(0)

      params = { 
        'ticket[user_id]' => @user.id,
        'ticket[title]' => '',
        'ticket[description]' => 'Remind me of something',
        'ticket[due_date]' => '',
        'ticket[status_id]' => '1',
        'ticket[progress]' => '1'
      }

      post '/v1/tickets', headers: @headers, params: params

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(Ticket.count).to eq(0)
      expect(response.code).to eq('422')
      expect(response_body[:details].first).to eq('Title can\'t be blank')
      expect(response_body[:details].last).to eq('Due date can\'t be blank')
    end
  end
end
