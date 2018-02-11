require 'rails_helper'
require 'json'

RSpec.describe V1::MoviesController, type: :controller do
  context '#index' do
    describe 'get method is called' do
      it 'should be success and json string' do
        get :index
        expect(response).to have_http_status(200)
        expect(response.body).to be_a(String)
        json_response = JSON.parse(response.body)
        json_response.each do |data|
          expect(data).to include('name')
        end
      end
    end
  end
  describe '#show' do
    let(:movie) do
      Movie.create(name: 'ironman', description: 'armor')
    end
    it 'show movie details' do
      puts movie.inspect
      get :show, params: { id: movie .id }
      expect(response).to have_http_status(200)
      expect(response.body).to be_a(String)
      json_response = JSON.parse(response.body)
      puts json_response
      expect(json_response[0]).to include('movie', 'review', 'avg_rating')
    end
  end
  describe '#average_rating' do
    let(:rating) do
      Rating.create(movie_id: 1, comment: 'good', rate: 3)
    end
    it 'should be success' do
      get :average_rating, params: { id: rating.movie_id }
      expect(response).to have_http_status(200)
      expect(response.body).to be_a(String)
      json_response = JSON.parse(response.body)
      puts json_response
      expect(json_response[0]['rating']).to include('avg_rating')
    end
  end
end
