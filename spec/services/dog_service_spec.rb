# frozen_string_literal: true

require 'rails_helper'

describe DogService do
  let(:breed) { 'akita' }
  let(:body)  do
    {
      message: 'https://images.dog.ceo/breeds/akita/Akita_hiking_in_Shpella_e_Pellumbasit.jpg',
      status: 'success'
    }
  end
  subject(:dog_service) { DogService.new(breed) }

  before do
    uri = URI("#{described_class::BASE_URL}/breed/#{breed.split.reverse.join('/')}/images/random")

    allow(Net::HTTP).to receive(:get_response).with(uri).and_return(instance_double(Net::HTTPOK, body: body.to_json))
  end

  context 'when breed name is valid' do
    it 'returns success' do
      expect(dog_service.call['status']).to eq('success')
    end

    it 'returns URL' do
      expect(dog_service.call['message']).to match(%r{https://images.dog.ceo/breeds/#{breed}/.*\.jpg})
    end

    context 'when breed name has spaces' do
      let(:breed) { 'Shepherd australian' }
      let(:body)  do
        {
          message: 'https://images.dog.ceo/breeds/australian-shepherd/pepper.jpg',
          status: 'success'
        }
      end

      it 'returns URL when a valid breed name has space' do
        expect(
          dog_service.call['message']
        ).to match(%r{https://images.dog.ceo/breeds/#{breed.downcase.split.reverse.join('-')}/.*\.jpg})
      end
    end
  end

  context 'when breed name is invalid' do
    let(:breed) { 'invalid_breed' }
    let(:body)  do
      {
        message: 'Breed not found (master breed does not exist)',
        status: 'error'
      }
    end

    it 'returns error' do
      expect(dog_service.call['status']).to eq('error')
    end

    it 'returns error message' do
      expect(dog_service.call['message']).to eq('Breed not found (master breed does not exist)')
    end
  end
end
