require 'rails_helper'
require 'json'

RSpec.describe V1::RatingController, type: :controller do
  describe '#create' do
    it 'should be success' do
      post :create, params: { rating: { movie_id: 1,
                                        rate: 3,
                                        comment: 'good' } }
      expect(response).to have_http_status(200)
      expect(response.body).to be_a(String)
      json_response = JSON.parse(response.body)
      puts json_response.keys
      expect(json_response).to include('rating')
    end
  end
end
