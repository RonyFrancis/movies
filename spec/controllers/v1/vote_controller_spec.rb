require 'rails_helper'

RSpec.describe V1::VoteController, type: :controller do
  describe '#vote' do
    it 'should be success and return json' do
      post :voting, params: { vote: { vote: 'up', rating_id: 1} }
      expect(response).to have_http_status(200)
      expect(response.body).to be_a(String)
      json_response = JSON.parse(response.body)
      expect(json_response).to include('vote')
    end
  end
end
