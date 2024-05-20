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

  context 'negative cases' do
    context 'validations' do
      shared_examples 'name validation error' do |breed|
        it 'words' do
          get path, params: { breed: }

          expect(response.body).to include('Please enter a valid Breed Name')
        end
      end

      # When input breed name has more than 2 words
      it_behaves_like 'name validation error', 'invalid breed name'

      # When input breed name is blank
      it_behaves_like 'name validation error', ''
    end

    context 'API response' do
      let(:breed) { 'invalid breed' }
      let(:body)  do
        {
          message: 'Breed not found (master breed does not exist)',
          status: 'error'
        }
      end

      before do
        uri = URI("#{DogService::BASE_URL}/breed/#{breed.split.reverse.join('/')}/images/random")

        allow(Net::HTTP).to receive(:get_response).with(uri).and_return(
          instance_double(Net::HTTPOK, body: body.to_json)
        )
      end

      it "returns 'breed not found' error" do
        get path, params: { breed: }

        expect(response.body).to include('Breed not found (master breed does not exist)')
      end
    end
  end
end
