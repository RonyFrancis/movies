require 'rails_helper'

RSpec.describe V1::VoteController, type: :controller do
  describe '#vote' do
    it 'should be success and return json' do
      post :voting, params: { vote_type: 'up', rating_id: 1 } 
      expect(response).to have_http_status(200)
    end
  end
end
