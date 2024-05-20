# frozen_string_literal: true

require 'rails_helper'

describe 'Dogs', type: :request do
  let(:path) { "#{dogs_fetch_path(format: :turbo_stream)}/" }

  context 'positive cases' do
    let(:breed) { 'akita' }
    let(:body) do
      {
        message: 'https://images.dog.ceo/breeds/akita/Akita_hiking_in_Shpella_e_Pellumbasit.jpg',
        status: 'success'
      }
    end

    before do
      uri = URI("#{DogService::BASE_URL}/breed/#{breed}/images/random")

      allow(Net::HTTP).to receive(:get_response).with(uri).and_return(instance_double(Net::HTTPOK, body: body.to_json))
    end

    describe 'GET /search/new' do
      it 'returns http success' do
        get dogs_search_new_path
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET /fetch' do
      it 'returns http success' do
        get path, params: { breed: 'akita' }

        expect(response).to have_http_status(:success)
      end

      it 'returns image URL and breed name' do
        get path, params: { breed: }

        expect(response.body).to match(%r{https://images.dog.ceo/breeds/#{breed}/.*\.jpg}).and(
          include(breed.titleize)
        )
      end
    end
  end
end
