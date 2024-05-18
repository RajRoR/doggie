# frozen_string_literal: true

require 'rails_helper'

describe 'Dogs', type: :request do
  describe 'GET /search/new' do
    it 'returns http success' do
      get '/dogs/search/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /fetch' do
    it 'returns http success' do
      get '/dogs/fetch?breed=akita'
      expect(response).to have_http_status(:success)
    end
  end
end
