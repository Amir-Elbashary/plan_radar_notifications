require 'rails_helper'

RSpec.describe 'Updating ticket data', type: :request do
  before do
    @ticket = create(:ticket)
  end

  context 'with valid data' do
    it 'should update ticket data' do
      params = {
        'ticket[user_id]' => @ticket.user.id,
        'ticket[title]' => 'New Ticket',
        'ticket[description]' => 'Remind me of something',
        'ticket[due_date]' => (Time.now + 2.minutes),
        'ticket[status_id]' => '1',
        'ticket[progress]' => '1'
      }

      put "/v1/tickets/#{@ticket.id}", headers: @headers, params: params

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response.code).to eq('200')
      expect(response_body[:title]).to eq('New Ticket')
      expect(Ticket.first.title).to eq('New Ticket')
    end
  end
end
