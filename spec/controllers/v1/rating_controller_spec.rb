require 'rails_helper'
require 'json'

RSpec.describe V1::RatingController, type: :controller do
  describe '#create' do
    let(:movie) do
      Movie.create(name: 'ironman', description: 'armor')
    end
    it 'should be success' do
      post :create, params: { rating: { movie_id: movie.id,
                                        rate: 3,
                                        comment: 'good' } }
      expect(response).to have_http_status(200)
      expect(response.body).to be_a(String)
      json_response = JSON.parse(response.body)
      expect(json_response).to include('id', 'rate', 'comment', 'movie_id', 'created_at', 'updated_at')
    end
  end
end
