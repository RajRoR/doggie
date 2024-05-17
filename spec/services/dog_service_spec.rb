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
    uri = URI("#{described_class::BASE_URL}/breed/#{breed}/images/random")

    allow(Net::HTTP).to receive(:get_response).with(uri).and_return(instance_double(Net::HTTPOK, body: body.to_json))
  end
end
